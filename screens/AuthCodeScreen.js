import React, { useState, useEffect } from 'react';
import {
  View,
  Text,
  StyleSheet,
  TextInput,
  TouchableOpacity,
  SafeAreaView,
  Alert,
  Dimensions,
  KeyboardAvoidingView,
  Platform,
} from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';

const { width } = Dimensions.get('window');

const AuthCodeScreen = ({ navigation, route }) => {
  const { story, childData, parentPhone, price, paymentMethod } = route.params;
  const [code, setCode] = useState(['', '', '', '', '', '']);
  const [timer, setTimer] = useState(300); // 5 دقائق
  const [isLoading, setIsLoading] = useState(false);
  const inputRefs = [];

  useEffect(() => {
    const interval = setInterval(() => {
      setTimer(prev => prev > 0 ? prev - 1 : 0);
    }, 1000);

    return () => clearInterval(interval);
  }, []);

  useEffect(() => {
    if (code.every(c => c !== '') && code.join('').length === 6) {
      verifyCode();
    }
  }, [code]);

  const handleCodeChange = (text, index) => {
    if (text.length > 1) {
      text = text.charAt(0);
    }

    const newCode = [...code];
    newCode[index] = text;
    setCode(newCode);

    if (text && index < 5) {
      inputRefs[index + 1]?.focus();
    }

    if (!text && index > 0) {
      inputRefs[index - 1]?.focus();
    }
  };

  const verifyCode = async () => {
    setIsLoading(true);
    
    // محاكاة اتصال بالسيرفر - الكود الصحيح هو 123456
    const enteredCode = code.join('');
    const validCode = '123456';
    
    setTimeout(async () => {
      if (enteredCode === validCode) {
        try {
          // حفظ حالة القصة المفتوحة
          const storiesState = await AsyncStorage.getItem('@stories_state');
          const parsed = storiesState ? JSON.parse(storiesState) : {};
          parsed[story.id] = true;
          
          await AsyncStorage.setItem('@stories_state', JSON.stringify(parsed));
          
          Alert.alert(
            '🎉 تهانينا!',
            `تم تفعيل قصة "${story.title}" بنجاح!\nيمكنك الآن قراءتها من مكتبة القصص.`,
            [
              { 
                text: 'الذهاب للمكتبة',
                onPress: () => navigation.navigate('StoryLibrary', { childData })
              }
            ]
          );
        } catch (error) {
          Alert.alert('خطأ', 'حدث خطأ أثناء حفظ بيانات التفعيل');
        }
      } else {
        Alert.alert(
          'خطأ',
          'كود التفعيل غير صحيح. يرجى المحاولة مرة أخرى.',
          [
            { 
              text: 'إعادة الإرسال', 
              onPress: resendCode 
            },
            { text: 'حسناً' }
          ]
        );
      }
      
      setIsLoading(false);
    }, 1500);
  };

  const resendCode = () => {
    setCode(['', '', '', '', '', '']);
    setTimer(300);
    inputRefs[0]?.focus();
    
    Alert.alert(
      'تم إعادة الإرسال',
      'تم إرسال كود جديد إلى هاتفك',
      [{ text: 'حسناً' }]
    );
  };

  const formatTime = (seconds) => {
    const mins = Math.floor(seconds / 60);
    const secs = seconds % 60;
    return `${mins.toString().padStart(2, '0')}:${secs.toString().padStart(2, '0')}`;
  };

  return (
    <SafeAreaView style={styles.container}>
      <KeyboardAvoidingView 
        behavior={Platform.OS === 'ios' ? 'padding' : 'height'}
        style={styles.keyboardView}
      >
        <View style={styles.content}>
          <View style={styles.header}>
            <Text style={styles.title}>🔓 كود التفعيل</Text>
            <Text style={styles.subtitle}>
              أدخل الكود المكون من 6 أرقام الذي تم إرساله إلى
            </Text>
            <Text style={styles.phoneNumber}>{parentPhone}</Text>
          </View>

          <View style={styles.timerContainer}>
            <Text style={styles.timerText}>
              ⏰ الكود صالح لمدة: {formatTime(timer)}
            </Text>
          </View>

          <View style={styles.codeContainer}>
            {code.map((digit, index) => (
              <TextInput
                key={index}
                ref={ref => inputRefs[index] = ref}
                style={[
                  styles.codeInput,
                  digit && styles.codeInputFilled
                ]}
                value={digit}
                onChangeText={text => handleCodeChange(text, index)}
                keyboardType="numeric"
                maxLength={1}
                textAlign="center"
                selectTextOnFocus
                editable={!isLoading}
              />
            ))}
          </View>

          <TouchableOpacity
            style={[
              styles.verifyButton,
              (code.some(c => c === '') || isLoading) && styles.verifyButtonDisabled
            ]}
            onPress={verifyCode}
            disabled={code.some(c => c === '') || isLoading}
          >
            <Text style={styles.verifyButtonText}>
              {isLoading ? 'جاري التحقق...' : 'تفعيل القصة'}
            </Text>
          </TouchableOpacity>

          <TouchableOpacity
            style={styles.resendButton}
            onPress={resendCode}
            disabled={timer > 0}
          >
            <Text style={[
              styles.resendText,
              timer > 0 && styles.resendTextDisabled
            ]}>
              {timer > 0 ? `إعادة الإرسال بعد ${formatTime(timer)}` : 'إعادة إرسال الكود'}
            </Text>
          </TouchableOpacity>

          <View style={styles.infoCard}>
            <Text style={styles.infoTitle}>معلومات الشراء:</Text>
            <View style={styles.infoRow}>
              <Text style={styles.infoLabel}>القصة:</Text>
              <Text style={styles.infoValue}>{story.title}</Text>
            </View>
            <View style={styles.infoRow}>
              <Text style={styles.infoLabel}>المبلغ:</Text>
              <Text style={styles.infoValue}>{price} جنيه مصري</Text>
            </View>
            <View style={styles.infoRow}>
              <Text style={styles.infoLabel}>طريقة الدفع:</Text>
              <Text style={styles.infoValue}>
                {paymentMethod === 'vodafone' ? 'فودافون كاش' : 'انستا باي'}
              </Text>
            </View>
            <View style={styles.infoRow}>
              <Text style={styles.infoLabel}>رقم التحويل:</Text>
              <Text style={styles.infoValue}>01033833119</Text>
            </View>
          </View>

          <View style={styles.supportCard}>
            <Text style={styles.supportTitle}>📞 للدعم الفني:</Text>
            <Text style={styles.supportText}>رقم الهاتف: 01033833119</Text>
            <Text style={styles.supportText}>ساعات العمل: 9 صباحاً - 10 مساءً</Text>
          </View>
        </View>
      </KeyboardAvoidingView>
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#F5F5F5',
  },
  keyboardView: {
    flex: 1,
  },
  content: {
    flex: 1,
    justifyContent: 'center',
    paddingHorizontal: 20,
  },
  header: {
    alignItems: 'center',
    marginBottom: 30,
  },
  title: {
    fontSize: 32,
    fontWeight: 'bold',
    color: '#4CAF50',
    marginBottom: 10,
  },
  subtitle: {
    fontSize: 16,
    color: '#666',
    textAlign: 'center',
    marginBottom: 5,
  },
  phoneNumber: {
    fontSize: 20,
    fontWeight: 'bold',
    color: '#333',
  },
  timerContainer: {
    alignItems: 'center',
    marginBottom: 40,
  },
  timerText: {
    fontSize: 16,
    color: '#FF9800',
    fontWeight: '600',
  },
  codeContainer: {
    flexDirection: 'row',
    justifyContent: 'center',
    marginBottom: 40,
    gap: 10,
  },
  codeInput: {
    width: 50,
    height: 60,
    borderWidth: 2,
    borderColor: '#BDBDBD',
    borderRadius: 10,
    fontSize: 28,
    fontWeight: 'bold',
    color: '#333',
    backgroundColor: '#fff',
  },
  codeInputFilled: {
    borderColor: '#4CAF50',
    backgroundColor: '#E8F5E9',
  },
  verifyButton: {
    backgroundColor: '#4CAF50',
    paddingVertical: 18,
    borderRadius: 12,
    alignItems: 'center',
    marginBottom: 20,
  },
  verifyButtonDisabled: {
    backgroundColor: '#A5D6A7',
  },
  verifyButtonText: {
    color: '#fff',
    fontSize: 20,
    fontWeight: 'bold',
  },
  resendButton: {
    alignItems: 'center',
    marginBottom: 40,
  },
  resendText: {
    fontSize: 16,
    color: '#2196F3',
    fontWeight: '600',
  },
  resendTextDisabled: {
    color: '#BDBDBD',
  },
  infoCard: {
    backgroundColor: '#fff',
    borderRadius: 15,
    padding: 20,
    marginBottom: 20,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
    elevation: 3,
  },
  infoTitle: {
    fontSize: 18,
    fontWeight: 'bold',
    color: '#333',
    marginBottom: 15,
    textAlign: 'right',
  },
  infoRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    marginBottom: 10,
    paddingBottom: 10,
    borderBottomWidth: 1,
    borderBottomColor: '#F5F5F5',
  },
  infoLabel: {
    fontSize: 14,
    color: '#666',
  },
  infoValue: {
    fontSize: 14,
    color: '#333',
    fontWeight: '500',
  },
  supportCard: {
    backgroundColor: '#E3F2FD',
    borderRadius: 15,
    padding: 20,
    marginBottom: 30,
  },
  supportTitle: {
    fontSize: 16,
    fontWeight: 'bold',
    color: '#1565C0',
    marginBottom: 10,
    textAlign: 'right',
  },
  supportText: {
    fontSize: 14,
    color: '#555',
    marginBottom: 5,
    textAlign: 'right',
  },
});

export default AuthCodeScreen;
