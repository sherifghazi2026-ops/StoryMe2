import React, { useState } from 'react';
import { 
  StyleSheet, 
  Text, 
  View, 
  Image, 
  TextInput, 
  TouchableOpacity,
  Alert,
  SafeAreaView,
  ScrollView,
  Dimensions,
  KeyboardAvoidingView,
  Platform
} from 'react-native';
import * as ImagePicker from 'expo-image-picker';

const { width } = Dimensions.get('window');

const FormScreen = ({ navigation }) => {
  const [name, setName] = useState('');
  const [age, setAge] = useState('');
  const [gender, setGender] = useState('');
  const [childPhoto, setChildPhoto] = useState(null);
  const [errors, setErrors] = useState({});

  const validateForm = () => {
    const newErrors = {};
    
    if (!name.trim()) {
      newErrors.name = 'يرجى إدخال اسم الطفل';
    }
    
    if (!age.trim()) {
      newErrors.age = 'يرجى إدخال عمر الطفل';
    } else if (isNaN(age) || parseInt(age) < 1 || parseInt(age) > 12) {
      newErrors.age = 'العمر يجب أن يكون بين 1 و 12 سنة';
    }
    
    if (!gender) {
      newErrors.gender = 'يرجى اختيار جنس الطفل';
    }
    
    setErrors(newErrors);
    return Object.keys(newErrors).length === 0;
  };

  const pickImage = async () => {
    try {
      const { status } = await ImagePicker.requestMediaLibraryPermissionsAsync();
      
      if (status !== 'granted') {
        Alert.alert(
          'صلاحية الملفات',
          'نحتاج صلاحية الوصول للصور لاختيار صورة الطفل',
          [
            { text: 'إلغاء', style: 'cancel' },
            { text: 'فتح الإعدادات', onPress: () => {} }
          ]
        );
        return;
      }

      const result = await ImagePicker.launchImageLibraryAsync({
        mediaTypes: ImagePicker.MediaTypeOptions.Images,
        allowsEditing: true,
        aspect: [1, 1],
        quality: 0.8,
      });

      if (!result.canceled) {
        setChildPhoto(result.assets[0].uri);
      }
    } catch (error) {
      Alert.alert('خطأ', 'حدث خطأ أثناء اختيار الصورة');
    }
  };

  const takePhoto = async () => {
    try {
      const { status } = await ImagePicker.requestCameraPermissionsAsync();
      
      if (status !== 'granted') {
        Alert.alert(
          'صلاحية الكاميرا',
          'نحتاج صلاحية الكاميرا لالتقاط صورة الطفل',
          [
            { text: 'إلغاء', style: 'cancel' },
            { text: 'فتح الإعدادات', onPress: () => {} }
          ]
        );
        return;
      }

      const result = await ImagePicker.launchCameraAsync({
        allowsEditing: true,
        aspect: [1, 1],
        quality: 0.8,
      });

      if (!result.canceled) {
        setChildPhoto(result.assets[0].uri);
      }
    } catch (error) {
      Alert.alert('خطأ', 'حدث خطأ أثناء التقاط الصورة');
    }
  };

  const handleContinue = () => {
    if (validateForm()) {
      const childData = {
        name,
        age,
        gender,
        photo: childPhoto,
        id: Date.now().toString()
      };
      
      navigation.navigate('StoryLibrary', { childData });
    }
  };

  return (
    <SafeAreaView style={styles.container}>
      <KeyboardAvoidingView 
        behavior={Platform.OS === 'ios' ? 'padding' : 'height'}
        style={styles.keyboardView}
      >
        <ScrollView 
          contentContainerStyle={styles.scrollContainer}
          showsVerticalScrollIndicator={false}
        >
          <View style={styles.header}>
            <Text style={styles.title}>👶 بيانات الطفل</Text>
            <Text style={styles.subtitle}>املأ بيانات طفلك للاستفادة القصوى من التطبيق</Text>
          </View>

          <View style={styles.formCard}>
            {/* حقل الاسم */}
            <View style={styles.inputGroup}>
              <Text style={styles.label}>
                اسم الطفل <Text style={styles.required}>*</Text>
              </Text>
              <TextInput
                style={[styles.input, errors.name && styles.inputError]}
                placeholder="أدخل اسم الطفل هنا"
                placeholderTextColor="#999"
                value={name}
                onChangeText={(text) => {
                  setName(text);
                  if (errors.name) setErrors({...errors, name: ''});
                }}
                textAlign="right"
                maxLength={30}
              />
              {errors.name && <Text style={styles.errorText}>{errors.name}</Text>}
            </View>

            {/* حقل العمر */}
            <View style={styles.inputGroup}>
              <Text style={styles.label}>
                عمر الطفل <Text style={styles.required}>*</Text>
              </Text>
              <TextInput
                style={[styles.input, errors.age && styles.inputError]}
                placeholder="أدخل عمر الطفل بالأرقام"
                placeholderTextColor="#999"
                value={age}
                onChangeText={(text) => {
                  setAge(text.replace(/[^0-9]/g, ''));
                  if (errors.age) setErrors({...errors, age: ''});
                }}
                keyboardType="numeric"
                textAlign="right"
                maxLength={2}
              />
              {errors.age && <Text style={styles.errorText}>{errors.age}</Text>}
            </View>

            {/* حقل الجنس */}
            <View style={styles.inputGroup}>
              <Text style={styles.label}>
                جنس الطفل <Text style={styles.required}>*</Text>
              </Text>
              <View style={styles.genderContainer}>
                <TouchableOpacity
                  style={[
                    styles.genderButton,
                    gender === 'ولد' && styles.genderActive,
                  ]}
                  onPress={() => {
                    setGender('ولد');
                    if (errors.gender) setErrors({...errors, gender: ''});
                  }}
                >
                  <Text style={[
                    styles.genderIcon,
                    gender === 'ولد' && styles.genderIconActive
                  ]}>👦</Text>
                  <Text style={[
                    styles.genderText,
                    gender === 'ولد' && styles.genderTextActive
                  ]}>ولد</Text>
                </TouchableOpacity>

                <TouchableOpacity
                  style={[
                    styles.genderButton,
                    gender === 'بنت' && styles.genderActive,
                  ]}
                  onPress={() => {
                    setGender('بنت');
                    if (errors.gender) setErrors({...errors, gender: ''});
                  }}
                >
                  <Text style={[
                    styles.genderIcon,
                    gender === 'بنت' && styles.genderIconActive
                  ]}>👧</Text>
                  <Text style={[
                    styles.genderText,
                    gender === 'بنت' && styles.genderTextActive
                  ]}>بنت</Text>
                </TouchableOpacity>
              </View>
              {errors.gender && <Text style={styles.errorText}>{errors.gender}</Text>}
            </View>

            {/* رفع الصورة */}
            <View style={styles.inputGroup}>
              <Text style={styles.label}>صورة الطفل (اختياري)</Text>
              <Text style={styles.hint}>يمكنك اختيار صورة من المعرض أو التقاط صورة جديدة</Text>
              
              <View style={styles.photoButtons}>
                <TouchableOpacity style={styles.photoButton} onPress={pickImage}>
                  <Text style={styles.photoButtonIcon}>📁</Text>
                  <Text style={styles.photoButtonText}>اختيار صورة</Text>
                </TouchableOpacity>
                
                <TouchableOpacity style={styles.photoButton} onPress={takePhoto}>
                  <Text style={styles.photoButtonIcon}>📸</Text>
                  <Text style={styles.photoButtonText}>التقاط صورة</Text>
                </TouchableOpacity>
              </View>

              {childPhoto && (
                <View style={styles.photoPreview}>
                  <Image source={{ uri: childPhoto }} style={styles.childPhoto} />
                  <TouchableOpacity 
                    style={styles.removePhoto}
                    onPress={() => setChildPhoto(null)}
                  >
                    <Text style={styles.removePhotoText}>✕</Text>
                  </TouchableOpacity>
                  <Text style={styles.photoPreviewText}>صورة الطفل</Text>
                </View>
              )}
            </View>

            {/* زر المتابعة */}
            <TouchableOpacity
              style={[
                styles.continueButton,
                (!name || !age || !gender) && styles.continueButtonDisabled
              ]}
              onPress={handleContinue}
              disabled={!name || !age || !gender}
            >
              <Text style={styles.continueButtonText}>
                📖 الذهاب لمكتبة القصص
              </Text>
              <Text style={styles.continueButtonSubtext}>
                {name ? `مرحباً ${name} 👋` : 'املأ البيانات أولاً'}
              </Text>
            </TouchableOpacity>
          </View>
        </ScrollView>
      </KeyboardAvoidingView>
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#F8F9FA',
  },
  keyboardView: {
    flex: 1,
  },
  scrollContainer: {
    flexGrow: 1,
    paddingBottom: 30,
  },
  header: {
    paddingHorizontal: 25,
    paddingTop: 20,
    paddingBottom: 15,
    backgroundColor: '#4CAF50',
    borderBottomLeftRadius: 30,
    borderBottomRightRadius: 30,
  },
  title: {
    fontSize: 32,
    fontWeight: 'bold',
    color: '#fff',
    textAlign: 'center',
    marginBottom: 8,
  },
  subtitle: {
    fontSize: 16,
    color: 'rgba(255, 255, 255, 0.9)',
    textAlign: 'center',
  },
  formCard: {
    backgroundColor: '#fff',
    marginHorizontal: 20,
    marginTop: 20,
    borderRadius: 25,
    padding: 25,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.1,
    shadowRadius: 12,
    elevation: 5,
  },
  inputGroup: {
    marginBottom: 25,
  },
  label: {
    fontSize: 17,
    fontWeight: '600',
    color: '#333',
    marginBottom: 10,
    textAlign: 'right',
  },
  required: {
    color: '#FF5252',
  },
  input: {
    backgroundColor: '#F8F9FA',
    padding: 16,
    borderRadius: 12,
    fontSize: 16,
    borderWidth: 1.5,
    borderColor: '#E9ECEF',
    textAlign: 'right',
    color: '#333',
  },
  inputError: {
    borderColor: '#FF5252',
    backgroundColor: '#FFF5F5',
  },
  errorText: {
    color: '#FF5252',
    fontSize: 14,
    marginTop: 6,
    textAlign: 'right',
  },
  hint: {
    fontSize: 14,
    color: '#6C757D',
    marginBottom: 15,
    textAlign: 'right',
  },
  genderContainer: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    gap: 15,
  },
  genderButton: {
    flex: 1,
    backgroundColor: '#F8F9FA',
    borderRadius: 15,
    padding: 18,
    alignItems: 'center',
    borderWidth: 2,
    borderColor: 'transparent',
  },
  genderActive: {
    backgroundColor: '#E8F5E9',
    borderColor: '#4CAF50',
  },
  genderIcon: {
    fontSize: 36,
    marginBottom: 8,
  },
  genderIconActive: {
    transform: [{ scale: 1.1 }],
  },
  genderText: {
    fontSize: 16,
    fontWeight: '600',
    color: '#666',
  },
  genderTextActive: {
    color: '#4CAF50',
    fontWeight: 'bold',
  },
  photoButtons: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    gap: 15,
    marginBottom: 20,
  },
  photoButton: {
    flex: 1,
    backgroundColor: '#F0F9FF',
    borderRadius: 12,
    padding: 15,
    alignItems: 'center',
    borderWidth: 1.5,
    borderColor: '#B3E5FC',
    borderStyle: 'dashed',
  },
  photoButtonIcon: {
    fontSize: 24,
    marginBottom: 8,
  },
  photoButtonText: {
    fontSize: 14,
    fontWeight: '600',
    color: '#0288D1',
  },
  photoPreview: {
    alignItems: 'center',
    marginTop: 10,
  },
  childPhoto: {
    width: 150,
    height: 150,
    borderRadius: 75,
    borderWidth: 4,
    borderColor: '#4CAF50',
  },
  removePhoto: {
    position: 'absolute',
    top: 5,
    right: width * 0.4,
    backgroundColor: '#FF5252',
    width: 32,
    height: 32,
    borderRadius: 16,
    alignItems: 'center',
    justifyContent: 'center',
  },
  removePhotoText: {
    color: '#fff',
    fontSize: 18,
    fontWeight: 'bold',
  },
  photoPreviewText: {
    marginTop: 10,
    fontSize: 14,
    color: '#666',
    fontStyle: 'italic',
  },
  continueButton: {
    backgroundColor: '#4CAF50',
    borderRadius: 15,
    padding: 20,
    alignItems: 'center',
    marginTop: 20,
    shadowColor: '#4CAF50',
    shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.3,
    shadowRadius: 8,
    elevation: 6,
  },
  continueButtonDisabled: {
    backgroundColor: '#A5D6A7',
    shadowOpacity: 0,
  },
  continueButtonText: {
    color: '#fff',
    fontSize: 20,
    fontWeight: 'bold',
    marginBottom: 5,
  },
  continueButtonSubtext: {
    color: 'rgba(255, 255, 255, 0.9)',
    fontSize: 14,
  },
});

export default FormScreen;
