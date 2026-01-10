import React, { useState } from 'react';
import {
  View,
  Text,
  StyleSheet,
  TextInput,
  TouchableOpacity,
  ScrollView,
  Alert,
  SafeAreaView,
  Image,
} from 'react-native';

const ChildFormScreen = ({ navigation, route }) => {
  const { story, childData } = route.params;
  
  const [parentPhone, setParentPhone] = useState(childData?.phone || '');
  const [paymentMethod, setPaymentMethod] = useState('');

  const handleSubmit = () => {
    if (!parentPhone.trim()) {
      Alert.alert('خطأ', 'الرجاء إدخال رقم هاتف ولي الأمر');
      return;
    }

    if (!paymentMethod) {
      Alert.alert('خطأ', 'الرجاء اختيار طريقة الدفع');
      return;
    }

    const paymentDetails = paymentMethod === 'vodafone' 
      ? 'فودافون كاش: 01033833119'
      : 'انستا باي: 01033833119';

    Alert.alert(
      'تفاصيل الدفع',
      `قصة "${story.title}"\nالسعر: ${story.price} جنيه\n\n` +
      `لإتمام عملية الشراء:\n` +
      `1. قم بالتحويل على الرقم: 01033833119\n` +
      `2. سنتصل بك على الرقم ${parentPhone} لتأكيد الدفع\n` +
      `3. بعد التأكيد، سيتم تفعيل القصة تلقائياً`,
      [
        { text: 'إلغاء', style: 'cancel' },
        { 
          text: 'تم التحويل', 
          onPress: () => navigation.navigate('AuthCode', {
            story,
            childData,
            parentPhone,
            price: story.price
          })
        }
      ]
    );
  };

  return (
    <SafeAreaView style={styles.container}>
      <ScrollView contentContainerStyle={styles.scrollContainer}>
        <Text style={styles.screenTitle}>💰 شراء القصة</Text>
        
        {/* معلومات القصة */}
        <View style={styles.storyInfo}>
          <Text style={styles.storyTitle}>{story.title}</Text>
          {story.image && (
            <Image source={{ uri: story.image }} style={styles.storyImage} />
          )}
          <Text style={styles.storyDescription}>{story.description}</Text>
          <View style={styles.priceContainer}>
            <Text style={styles.priceText}>السعر: {story.price} جنيه مصري</Text>
          </View>
        </View>

        {/* معلومات الطفل */}
        {childData && (
          <View style={styles.childInfo}>
            <Text style={styles.childInfoTitle}>👶 معلومات الطفل:</Text>
            <View style={styles.childDetails}>
              {childData.photo ? (
                <Image source={{ uri: childData.photo }} style={styles.childPhoto} />
              ) : (
                <View style={styles.childIcon}>
                  <Text style={styles.childIconText}>
                    {childData.gender === 'ولد' ? '👦' : '👧'}
                  </Text>
                </View>
              )}
              <View style={styles.childTextInfo}>
                <Text style={styles.childName}>{childData.name}</Text>
                <Text style={styles.childDetailsText}>
                  {childData.age} سنة - {childData.gender}
                </Text>
              </View>
            </View>
          </View>
        )}

        {/* رقم هاتف ولي الأمر */}
        <View style={styles.inputGroup}>
          <Text style={styles.inputLabel}>📱 رقم هاتف ولي الأمر:</Text>
          <Text style={styles.inputHint}>سيتم التواصل على هذا الرقم لتأكيد الدفع</Text>
          <TextInput
            style={styles.input}
            placeholder="مثال: 01012345678"
            value={parentPhone}
            onChangeText={setParentPhone}
            keyboardType="phone-pad"
            textAlign="right"
            maxLength={11}
          />
        </View>

        {/* طرق الدفع */}
        <View style={styles.inputGroup}>
          <Text style={styles.inputLabel}>💳 طريقة الدفع:</Text>
          <View style={styles.paymentMethods}>
            <TouchableOpacity
              style={[
                styles.paymentMethod,
                paymentMethod === 'vodafone' && styles.selectedPayment
              ]}
              onPress={() => setPaymentMethod('vodafone')}
            >
              <Text style={styles.paymentIcon}>📱</Text>
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
              <Text style={styles.paymentIcon}>💳</Text>
              <Text style={styles.paymentText}>انستا باي</Text>
              <Text style={styles.paymentNumber}>01033833119</Text>
            </TouchableOpacity>
          </View>
        </View>

        {/* معلومات الدفع */}
        <View style={styles.paymentInfo}>
          <Text style={styles.infoTitle}>📋 خطوات إتمام الشراء:</Text>
          <Text style={styles.infoStep}>1. قم بالتحويل على الرقم أعلاه</Text>
          <Text style={styles.infoStep}>2. احتفظ برقم التحويل</Text>
          <Text style={styles.infoStep}>3. سنتصل بك على {parentPhone || 'رقمك'}</Text>
          <Text style={styles.infoStep}>4. أدخل كود التفعيل في الشاشة التالية</Text>
          <Text style={styles.infoStep}>5. استمتع بالقصة مع طفلك! 🎉</Text>
        </View>

        {/* زر المتابعة */}
        <TouchableOpacity 
          style={[styles.submitButton, (!parentPhone || !paymentMethod) && styles.disabledButton]}
          onPress={handleSubmit}
          disabled={!parentPhone || !paymentMethod}
        >
          <Text style={styles.submitButtonText}>متابعة لإدخال كود التفعيل</Text>
          <Text style={styles.submitButtonSubtext}>
            {parentPhone ? `سيتم التواصل على ${parentPhone}` : 'أدخل رقم الهاتف أولاً'}
          </Text>
        </TouchableOpacity>
      </ScrollView>
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#F5F5F5',
  },
  scrollContainer: {
    padding: 20,
    paddingBottom: 40,
  },
  screenTitle: {
    fontSize: 28,
    fontWeight: 'bold',
    marginBottom: 25,
    textAlign: 'center',
    color: '#2C3E50',
  },
  storyInfo: {
    backgroundColor: '#FFFFFF',
    borderRadius: 20,
    padding: 20,
    marginBottom: 20,
    elevation: 4,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 3 },
    shadowOpacity: 0.15,
    shadowRadius: 8,
    alignItems: 'center',
  },
  storyTitle: {
    fontSize: 24,
    fontWeight: 'bold',
    color: '#4A90E2',
    marginBottom: 15,
    textAlign: 'center',
  },
  storyImage: {
    width: 120,
    height: 120,
    borderRadius: 15,
    marginBottom: 15,
  },
  storyDescription: {
    fontSize: 16,
    color: '#666',
    textAlign: 'center',
    marginBottom: 15,
    lineHeight: 24,
  },
  priceContainer: {
    backgroundColor: '#FF9800',
    paddingVertical: 12,
    paddingHorizontal: 30,
    borderRadius: 12,
  },
  priceText: {
    color: '#FFFFFF',
    fontSize: 20,
    fontWeight: 'bold',
  },
  childInfo: {
    backgroundColor: '#E8F5E9',
    borderRadius: 15,
    padding: 15,
    marginBottom: 20,
  },
  childInfoTitle: {
    fontSize: 16,
    fontWeight: 'bold',
    color: '#2E7D32',
    marginBottom: 10,
    textAlign: 'right',
  },
  childDetails: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  childPhoto: {
    width: 60,
    height: 60,
    borderRadius: 30,
    marginLeft: 15,
  },
  childIcon: {
    width: 60,
    height: 60,
    borderRadius: 30,
    backgroundColor: '#4CAF50',
    justifyContent: 'center',
    alignItems: 'center',
    marginLeft: 15,
  },
  childIconText: {
    fontSize: 28,
    color: '#FFFFFF',
  },
  childTextInfo: {
    flex: 1,
  },
  childName: {
    fontSize: 18,
    fontWeight: 'bold',
    color: '#333',
    textAlign: 'right',
    marginBottom: 5,
  },
  childDetailsText: {
    fontSize: 14,
    color: '#666',
    textAlign: 'right',
  },
  inputGroup: {
    marginBottom: 25,
  },
  inputLabel: {
    fontSize: 18,
    marginBottom: 8,
    fontWeight: '600',
    color: '#2C3E50',
    textAlign: 'right',
  },
  inputHint: {
    fontSize: 14,
    color: '#666',
    marginBottom: 10,
    textAlign: 'right',
    fontStyle: 'italic',
  },
  input: {
    backgroundColor: '#fff',
    borderRadius: 12,
    padding: 16,
    borderWidth: 1.5,
    borderColor: '#ddd',
    textAlign: 'right',
    fontSize: 16,
    color: '#333',
  },
  paymentMethods: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    marginTop: 10,
  },
  paymentMethod: {
    flex: 1,
    backgroundColor: '#FFFFFF',
    borderRadius: 12,
    padding: 20,
    alignItems: 'center',
    marginHorizontal: 5,
    borderWidth: 2,
    borderColor: '#E0E0E0',
    elevation: 2,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
  },
  selectedPayment: {
    borderColor: '#4CAF50',
    backgroundColor: '#E8F5E9',
  },
  paymentIcon: {
    fontSize: 32,
    marginBottom: 10,
  },
  paymentText: {
    fontSize: 16,
    fontWeight: 'bold',
    color: '#333',
    marginBottom: 5,
  },
  paymentNumber: {
    fontSize: 14,
    color: '#666',
    fontFamily: 'monospace',
  },
  paymentInfo: {
    backgroundColor: '#F0F9FF',
    borderRadius: 15,
    padding: 20,
    marginBottom: 25,
  },
  infoTitle: {
    fontSize: 16,
    fontWeight: 'bold',
    color: '#0288D1',
    marginBottom: 15,
    textAlign: 'right',
  },
  infoStep: {
    fontSize: 14,
    color: '#555',
    marginBottom: 10,
    textAlign: 'right',
    lineHeight: 22,
  },
  submitButton: {
    backgroundColor: '#4CAF50',
    borderRadius: 15,
    padding: 20,
    alignItems: 'center',
    elevation: 5,
    shadowColor: '#4CAF50',
    shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.3,
    shadowRadius: 8,
  },
  disabledButton: {
    backgroundColor: '#A5D6A7',
    shadowOpacity: 0,
  },
  submitButtonText: {
    color: '#fff',
    fontSize: 20,
    fontWeight: 'bold',
    marginBottom: 8,
  },
  submitButtonSubtext: {
    color: 'rgba(255, 255, 255, 0.9)',
    fontSize: 14,
    textAlign: 'center',
  },
});

export default ChildFormScreen;
