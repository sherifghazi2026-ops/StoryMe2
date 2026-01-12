import React, { useState } from 'react';
import {
  View,
  Text,
  TextInput,
  TouchableOpacity,
  StyleSheet,
  Alert
} from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

export default function AuthCodeScreen({ navigation, route }) {
  const { pack } = route.params || {};
  const [authCode, setAuthCode] = useState('');
  const [phoneNumber, setPhoneNumber] = useState('');

  const handleSubmit = () => {
    if (!authCode.trim() || !phoneNumber.trim()) {
      Alert.alert('خطأ', 'يرجى ملء جميع الحقول');
      return;
    }

    // هنا يمكنك إضافة التحقق من صحة الكود مع السيرفر
    Alert.alert(
      'طلب التحقق',
      `تم إرسال طلب التحقق للباقة "${pack?.title}"\nسنقوم بالتواصل معك على الرقم ${phoneNumber} للتأكيد.`,
      [
        {
          text: 'حسناً',
          onPress: () => {
            navigation.goBack();
          }
        }
      ]
    );
  };

  if (!pack) {
    return (
      <SafeAreaView style={styles.container}>
        <View style={styles.errorContainer}>
          <Text style={styles.errorText}>لم يتم العثور على الباقة</Text>
          <TouchableOpacity
            style={styles.backButton}
            onPress={() => navigation.goBack()}
          >
            <Text style={styles.backButtonText}>العودة</Text>
          </TouchableOpacity>
        </View>
      </SafeAreaView>
    );
  }

  return (
    <SafeAreaView style={styles.container}>
      <View style={styles.header}>
        <Text style={styles.appTitle}>🔑 كود التفعيل</Text>
        
        <TouchableOpacity
          style={styles.smallBackButton}
          onPress={() => navigation.goBack()}
        >
          <Text style={styles.smallBackButtonText}>↩️ العودة</Text>
        </TouchableOpacity>
      </View>
      
      <View style={styles.content}>
        <View style={styles.packInfo}>
          <Text style={styles.packTitle}>{pack.title}</Text>
          <Text style={styles.packPrice}>السعر: {pack.price} ج.م</Text>
          <Text style={styles.packDescription}>{pack.description}</Text>
        </View>
        
        <View style={styles.form}>
          <Text style={styles.inputLabel}>📱 رقم الهاتف:</Text>
          <TextInput
            style={styles.input}
            placeholder="أدخل رقم هاتفك للتواصل"
            value={phoneNumber}
            onChangeText={setPhoneNumber}
            keyboardType="phone-pad"
            textAlign="right"
          />
          
          <Text style={styles.inputLabel}>🔢 كود التفعيل:</Text>
          <TextInput
            style={styles.input}
            placeholder="أدخل كود التفعيل المكون من 6 أرقام"
            value={authCode}
            onChangeText={setAuthCode}
            keyboardType="numeric"
            maxLength={6}
            textAlign="right"
          />
          
          <Text style={styles.instructions}>
            للحصول على كود التفعيل:
            {"\n"}1. قم بدفع {pack.price} ج.م عبر فودافون كاش أو انستا باي على الرقم 01033833119
            {"\n"}2. سنقوم بالتواصل معك عبر واتساب لإرسال كود التفعيل
            {"\n"}3. أدخل الكود هنا لتفعيل الباقة
          </Text>
          
          <TouchableOpacity
            style={[styles.submitButton, (!authCode || !phoneNumber) && styles.disabledButton]}
            onPress={handleSubmit}
            disabled={!authCode || !phoneNumber}
          >
            <Text style={styles.submitButtonText}>تفعيل الباقة</Text>
          </TouchableOpacity>
          
          <TouchableOpacity
            style={styles.whatsappButton}
            onPress={() => {
              // يمكن إضافة رابط واتساب
              Alert.alert('تواصل معنا', 'للحصول على كود التفعيل، تواصل معنا على واتساب: 01033833119');
            }}
          >
            <Text style={styles.whatsappButtonText}>💬 تواصل عبر واتساب</Text>
          </TouchableOpacity>
        </View>
      </View>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#E8F4FD',
  },
  errorContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    padding: 20,
  },
  errorText: {
    fontSize: 20,
    color: '#FF6B6B',
    marginBottom: 20,
  },
  header: {
    padding: 20,
    backgroundColor: '#4A90E2',
    borderBottomLeftRadius: 25,
    borderBottomRightRadius: 25,
    alignItems: 'center',
    marginBottom: 10,
    position: 'relative',
  },
  appTitle: {
    fontSize: 26,
    fontWeight: 'bold',
    color: '#FFFFFF',
    textAlign: 'center',
    marginBottom: 15,
  },
  smallBackButton: {
    position: 'absolute',
    top: 15,
    left: 15,
    backgroundColor: 'rgba(255, 255, 255, 0.3)',
    padding: 8,
    borderRadius: 10,
  },
  smallBackButtonText: {
    color: '#FFFFFF',
    fontSize: 14,
    fontWeight: '600',
  },
  content: {
    padding: 20,
  },
  packInfo: {
    backgroundColor: '#FFFFFF',
    borderRadius: 15,
    padding: 20,
    marginBottom: 20,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
    elevation: 3,
  },
  packTitle: {
    fontSize: 22,
    fontWeight: 'bold',
    color: '#2C3E50',
    textAlign: 'center',
    marginBottom: 10,
  },
  packPrice: {
    fontSize: 18,
    color: '#FF9800',
    textAlign: 'center',
    marginBottom: 10,
    fontWeight: 'bold',
  },
  packDescription: {
    fontSize: 16,
    color: '#5D6D7E',
    textAlign: 'center',
    lineHeight: 24,
  },
  form: {
    backgroundColor: '#FFFFFF',
    borderRadius: 15,
    padding: 20,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
    elevation: 3,
  },
  inputLabel: {
    fontSize: 16,
    fontWeight: 'bold',
    color: '#2C3E50',
    marginBottom: 8,
    textAlign: 'right',
  },
  input: {
    backgroundColor: '#F8F9F9',
    padding: 15,
    borderRadius: 12,
    fontSize: 16,
    borderWidth: 1,
    borderColor: '#D6DBDF',
    textAlign: 'right',
    marginBottom: 20,
  },
  instructions: {
    fontSize: 14,
    color: '#5D6D7E',
    lineHeight: 22,
    marginBottom: 20,
    textAlign: 'right',
    backgroundColor: '#F8F9F9',
    padding: 15,
    borderRadius: 10,
  },
  submitButton: {
    backgroundColor: '#4CAF50',
    padding: 18,
    borderRadius: 12,
    alignItems: 'center',
    marginBottom: 15,
  },
  disabledButton: {
    backgroundColor: '#AAB7B8',
  },
  submitButtonText: {
    color: '#FFFFFF',
    fontSize: 18,
    fontWeight: 'bold',
  },
  whatsappButton: {
    backgroundColor: '#25D366',
    padding: 18,
    borderRadius: 12,
    alignItems: 'center',
  },
  whatsappButtonText: {
    color: '#FFFFFF',
    fontSize: 16,
    fontWeight: 'bold',
  },
  backButton: {
    backgroundColor: '#4A90E2',
    padding: 12,
    borderRadius: 8,
    alignItems: 'center',
  },
  backButtonText: {
    color: '#FFFFFF',
    fontSize: 16,
    fontWeight: 'bold',
  },
});
