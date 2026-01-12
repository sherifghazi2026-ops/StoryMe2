import React, { useState } from 'react';
import {
  View,
  Text,
  TextInput,
  TouchableOpacity,
  StyleSheet,
  ScrollView,
  Alert,
  Linking
} from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

export default function CustomStoryScreen({ navigation, route, childInfo }) {
  const [storyIdea, setStoryIdea] = useState('');
  const [whatsappNumber, setWhatsappNumber] = useState('');
  const [lessons, setLessons] = useState('');
  const [paymentMethod, setPaymentMethod] = useState('');
  const [paymentPhone, setPaymentPhone] = useState('');

  const handleCustomStoryPayment = () => {
    if (!storyIdea || !whatsappNumber || !lessons || !paymentMethod || !paymentPhone) {
      Alert.alert('خطأ', 'يرجى ملء جميع الحقول المطلوبة');
      return;
    }

    let paymentDetails = '';
    if (paymentMethod === 'vodafone') {
      paymentDetails = 'فودافون كاش: 01033833119';
    } else if (paymentMethod === 'instapay') {
      paymentDetails = 'انستا باي: 01033833119';
    }

    Alert.alert(
      'طلب القصة المخصصة',
      `شكرًا لطلبك!\n\nسنتواصل معك على الرقم 01033833119 للتحقق من الدفع.\nبعد التأكيد، سيتم إنشاء القصة المخصصة وإرسال رابط الفيديو على واتساب ${whatsappNumber} في خلال ٣ أيام عمل.\n\nتفاصيل الدفع:\n${paymentDetails}`,
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

  const openPaymentApp = (method) => {
    let url = '';
    if (method === 'vodafone') {
      url = 'vodafonecash://';
    } else if (method === 'instapay') {
      url = 'instapay://';
    }
    
    if (url) {
      Linking.openURL(url).catch(err => {
        const webUrl = method === 'vodafone' 
          ? 'https://www.vodafone.com.eg/vodafonecash/' 
          : 'https://www.instapay.com/';
        Linking.openURL(webUrl).catch(() => {
          Alert.alert('تنبيه', 'يرجى فتح تطبيق الدفع المطلوب يدويًا');
        });
      });
    }
  };

  return (
    <SafeAreaView style={styles.container}>
      <View style={styles.header}>
        <Text style={styles.appTitle}>📝 قصة مخصصة بالذكاء الاصطناعي</Text>
        
        <TouchableOpacity
          style={styles.smallBackButton}
          onPress={() => navigation.goBack()}
        >
          <Text style={styles.smallBackButtonText}>↩️ العودة</Text>
        </TouchableOpacity>
      </View>
      
      <ScrollView contentContainerStyle={styles.customStoryContainer}>
        {/* معلومات الطفل */}
        {childInfo && (
          <View style={styles.childInfoCard}>
            <Text style={styles.sectionTitle}>معلومات الطفل:</Text>
            <View style={styles.childInfoRow}>
              <View style={styles.childInfoText}>
                <Text style={styles.infoText}>الاسم: {childInfo.name}</Text>
                <Text style={styles.infoText}>العمر: {childInfo.age} سنة</Text>
                <Text style={styles.infoText}>الجنس: {childInfo.gender}</Text>
              </View>
            </View>
          </View>
        )}
        
        {/* فكرة القصة */}
        <View style={styles.inputCard}>
          <Text style={styles.inputLabel}>💡 فكرة القصة المطلوبة:</Text>
          <TextInput
            style={[styles.textArea, { textAlign: 'right' }]}
            placeholder="اكتب فكرة القصة التي تريدها (مثال: قصة عن طفل يكتشف سحر القراءة)"
            value={storyIdea}
            onChangeText={setStoryIdea}
            multiline
            numberOfLines={4}
          />
        </View>
        
        {/* رقم الواتساب */}
        <View style={styles.inputCard}>
          <Text style={styles.inputLabel}>📱 رقم الواتساب للإرسال:</Text>
          <TextInput
            style={styles.input}
            placeholder="مثال: 201234567890+"
            value={whatsappNumber}
            onChangeText={setWhatsappNumber}
            keyboardType="phone-pad"
            textAlign="right"
          />
        </View>
        
        {/* الدروس المستفادة */}
        <View style={styles.inputCard}>
          <Text style={styles.inputLabel}>🎯 الدروس المراد الاستفادة منها:</Text>
          <TextInput
            style={[styles.textArea, { textAlign: 'right' }]}
            placeholder="اكتب الدروس التي تريد تعليمها للطفل (مثال: أهمية الصدق، التعاون مع الآخرين)"
            value={lessons}
            onChangeText={setLessons}
            multiline
            numberOfLines={4}
          />
        </View>
        
        {/* وسائل الدفع */}
        <View style={styles.inputCard}>
          <Text style={styles.inputLabel}>💳 وسيلة الدفع:</Text>
          
          <View style={styles.paymentMethods}>
            <TouchableOpacity
              style={[
                styles.paymentMethod,
                paymentMethod === 'vodafone' && styles.selectedPayment
              ]}
              onPress={() => setPaymentMethod('vodafone')}
            >
              <Text style={styles.paymentText}>فودافون كاش</Text>
              <Text style={styles.paymentNumber}>01033833119</Text>
            </TouchableOpacity>
            
            <TouchableOpacity
              style={[
                styles.paymentMethod,
                paymentMethod === 'instapay' && styles.selectedPayment
              ]}
              onPress={() => setPaymentMethod('instapay')}
            >
              <Text style={styles.paymentText}>انستا باي</Text>
              <Text style={styles.paymentNumber}>01033833119</Text>
            </TouchableOpacity>
          </View>
          
          {paymentMethod && (
            <View style={styles.paymentDetails}>
              <Text style={styles.paymentLabel}>رقم هاتفك للتحقق:</Text>
              <TextInput
                style={styles.input}
                placeholder="أدخل رقم هاتفك للتحقق من الدفع"
                value={paymentPhone}
                onChangeText={setPaymentPhone}
                keyboardType="phone-pad"
                textAlign="right"
              />
              <TouchableOpacity
                style={styles.openAppButton}
                onPress={() => openPaymentApp(paymentMethod)}
              >
                <Text style={styles.openAppText}>
                  {paymentMethod === 'vodafone' ? '💸 افتح فودافون كاش' : '💳 افتح انستا باي'}
                </Text>
              </TouchableOpacity>
            </View>
          )}
        </View>
        
        {/* معلومات التوصيل */}
        <View style={styles.deliveryInfo}>
          <Text style={styles.deliveryTitle}>⏰ معلومات التوصيل:</Text>
          <Text style={styles.deliveryText}>
            • سيتم إرسال رابط الفيديو على واتسابك خلال ٣ أيام عمل
          </Text>
          <Text style={styles.deliveryText}>
            • الفيديو برسوم كرتونية متحركة بصوت محترف
          </Text>
          <Text style={styles.deliveryText}>
            • مدة الفيديو: ٣-٥ دقائق
          </Text>
          <Text style={styles.deliveryText}>
            • السعر: 50 جنيهاً مصرياً
          </Text>
        </View>
        
        {/* زر الشراء */}
        <TouchableOpacity 
          style={[styles.buyButton, (!storyIdea || !whatsappNumber || !lessons || !paymentMethod || !paymentPhone) && styles.disabledButton]}
          onPress={handleCustomStoryPayment}
          disabled={!storyIdea || !whatsappNumber || !lessons || !paymentMethod || !paymentPhone}
        >
          <Text style={styles.buyButtonText}>💳 شراء القصة المخصصة (50 ج.م)</Text>
        </TouchableOpacity>
        
        <Text style={styles.note}>
          ملاحظة: بعد الشراء، سنتصل بك على الرقم 01033833119 لتأكيد تفاصيل القصة
        </Text>
      </ScrollView>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#E8F4FD',
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
  customStoryContainer: {
    padding: 20,
    paddingBottom: 40,
  },
  childInfoCard: {
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
  sectionTitle: {
    fontSize: 18,
    fontWeight: 'bold',
    color: '#2C3E50',
    marginBottom: 15,
    textAlign: 'right',
  },
  childInfoRow: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  childInfoText: {
    flex: 1,
  },
  infoText: {
    fontSize: 16,
    color: '#5D6D7E',
    marginBottom: 5,
    textAlign: 'right',
  },
  inputCard: {
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
  inputLabel: {
    fontSize: 16,
    fontWeight: 'bold',
    color: '#2C3E50',
    marginBottom: 10,
    textAlign: 'right',
  },
  textArea: {
    backgroundColor: '#fff',
    padding: 15,
    borderRadius: 12,
    marginBottom: 15,
    fontSize: 16,
    borderWidth: 1,
    borderColor: '#D6DBDF',
    textAlignVertical: 'top',
    minHeight: 100,
  },
  input: {
    backgroundColor: '#fff',
    padding: 15,
    borderRadius: 12,
    fontSize: 16,
    borderWidth: 1,
    borderColor: '#D6DBDF',
    textAlign: 'right',
  },
  paymentMethods: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    marginBottom: 15,
  },
  paymentMethod: {
    flex: 1,
    padding: 15,
    borderRadius: 12,
    borderWidth: 2,
    borderColor: '#D6DBDF',
    alignItems: 'center',
    marginHorizontal: 5,
  },
  selectedPayment: {
    borderColor: '#4A90E2',
    backgroundColor: '#E8F4FD',
  },
  paymentText: {
    fontSize: 14,
    fontWeight: 'bold',
    color: '#2C3E50',
    marginBottom: 5,
  },
  paymentNumber: {
    fontSize: 12,
    color: '#5D6D7E',
  },
  paymentDetails: {
    marginTop: 15,
  },
  paymentLabel: {
    fontSize: 14,
    color: '#5D6D7E',
    marginBottom: 8,
    textAlign: 'right',
  },
  openAppButton: {
    backgroundColor: '#4A90E2',
    padding: 12,
    borderRadius: 8,
    alignItems: 'center',
    marginTop: 10,
  },
  openAppText: {
    color: '#FFFFFF',
    fontSize: 16,
    fontWeight: '600',
  },
  deliveryInfo: {
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
  deliveryTitle: {
    fontSize: 16,
    fontWeight: 'bold',
    color: '#2C3E50',
    marginBottom: 10,
    textAlign: 'right',
  },
  deliveryText: {
    fontSize: 14,
    color: '#5D6D7E',
    marginBottom: 8,
    textAlign: 'right',
    lineHeight: 20,
  },
  buyButton: {
    backgroundColor: '#FFD166',
    padding: 18,
    borderRadius: 15,
    alignItems: 'center',
    shadowColor: '#FFD166',
    shadowOffset: { width: 0, height: 3 },
    shadowOpacity: 0.3,
    shadowRadius: 5,
    elevation: 5,
    marginTop: 20,
    marginBottom: 10,
  },
  disabledButton: {
    backgroundColor: '#AAB7B8',
    shadowOpacity: 0,
  },
  buyButtonText: {
    color: '#000',
    fontSize: 18,
    fontWeight: 'bold',
  },
  note: {
    fontSize: 12,
    color: '#95A5A6',
    textAlign: 'center',
    marginTop: 10,
    fontStyle: 'italic',
  },
});
