import React, { useState } from 'react';
import { 
  View, 
  Text, 
  TextInput, 
  TouchableOpacity, 
  StyleSheet, 
  Image,
  Alert,
  Platform 
} from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import * as ImagePicker from 'expo-image-picker';

export default function FormScreen({ navigation, route, updateChildInfo }) {
  const { language = 'ar' } = route.params || {};
  const [name, setName] = useState('');
  const [age, setAge] = useState('');
  const [gender, setGender] = useState('');
  const [childPhoto, setChildPhoto] = useState(null);

  const pickImage = async (source = 'library') => {
    try {
      let result;
      
      if (source === 'camera') {
        // طلب صلاحية الكاميرا
        if (Platform.OS === 'web') {
          Alert.alert('معلومات', 'الكاميرا غير متاحة على المتصفح');
          return;
        }
        
        const { status } = await ImagePicker.requestCameraPermissionsAsync();
        if (status !== 'granted') {
          Alert.alert(
            'صلاحية الكاميرا',
            'نحتاج صلاحية الوصول للكاميرا لالتقاط الصور',
            [
              { text: 'إلغاء', style: 'cancel' },
              { text: 'فتح الإعدادات', onPress: () => {} }
            ]
          );
          return;
        }
        
        result = await ImagePicker.launchCameraAsync({
          mediaTypes: ImagePicker.MediaTypeOptions.Images,
          allowsEditing: true,
          aspect: [1, 1],
          quality: 0.7,
        });
      } else {
        const { status } = await ImagePicker.requestMediaLibraryPermissionsAsync();
        
        if (status !== 'granted') {
          Alert.alert('صلاحية المعرض', 'نحتاج صلاحية الوصول للصور');
          return;
        }

        result = await ImagePicker.launchImageLibraryAsync({
          mediaTypes: ImagePicker.MediaTypeOptions.Images,
          allowsEditing: true,
          aspect: [1, 1],
          quality: 0.8,
        });
      }

      if (!result.canceled && result.assets && result.assets[0]) {
        setChildPhoto(result.assets[0].uri);
      }
    } catch (error) {
      console.error('Error picking image:', error);
      Alert.alert('خطأ', 'حدث خطأ أثناء اختيار الصورة');
    }
  };

  const handleSubmit = () => {
    if (!name.trim()) {
      Alert.alert('خطأ', 'يرجى إدخال اسم الطفل');
      return;
    }

    if (!age.trim()) {
      Alert.alert('خطأ', 'يرجى إدخال عمر الطفل');
      return;
    }

    // التحقق من صحة العمر
    const ageNumber = parseInt(age, 10);
    if (isNaN(ageNumber) || ageNumber < 1 || ageNumber > 18) {
      Alert.alert('خطأ', 'يرجى إدخال عمر صحيح بين 1 و 18 سنة');
      return;
    }

    if (!gender) {
      Alert.alert('خطأ', 'يرجى اختيار جنس الطفل');
      return;
    }

    const childData = {
      name: name.trim(),
      age: ageNumber.toString(),
      gender,
      photo: childPhoto,
      language,
      createdAt: new Date().toISOString()
    };

    updateChildInfo(childData);
    navigation.navigate('StoryLibrary');
  };

  return (
    <SafeAreaView style={styles.container}>
      <View style={styles.formContainer}>
        <Text style={styles.title}>قصص الأطفال 📚</Text>

        <View style={styles.inputGroup}>
          <Text style={styles.label}>اسم الطفل *</Text>
          <TextInput
            style={styles.input}
            placeholder="أدخل اسم الطفل"
            value={name}
            onChangeText={setName}
            textAlign="right"
            autoCorrect={false}
          />
        </View>

        <View style={styles.inputGroup}>
          <Text style={styles.label}>العمر *</Text>
          <TextInput
            style={styles.input}
            placeholder="أدخل العمر (مثال: 6)"
            keyboardType="numeric"
            value={age}
            onChangeText={setAge}
            textAlign="right"
            maxLength={2}
          />
        </View>

        <View style={styles.inputGroup}>
          <Text style={styles.label}>الجنس *</Text>
          <View style={styles.genderContainer}>
            <TouchableOpacity
              style={[
                styles.genderOption,
                gender === 'ولد' && styles.activeGender,
              ]}
              onPress={() => setGender('ولد')}
            >
              <Text style={[
                styles.genderText,
                gender === 'ولد' && styles.activeGenderText
              ]}>👦 ولد</Text>
            </TouchableOpacity>

            <TouchableOpacity
              style={[
                styles.genderOption,
                gender === 'بنت' && styles.activeGender,
              ]}
              onPress={() => setGender('بنت')}
            >
              <Text style={[
                styles.genderText,
                gender === 'بنت' && styles.activeGenderText
              ]}>👧 بنت</Text>
            </TouchableOpacity>
          </View>
        </View>

        <View style={styles.inputGroup}>
          <Text style={styles.label}>صورة الطفل (اختياري)</Text>
          <View style={styles.photoButtonsContainer}>
            <TouchableOpacity 
              style={styles.photoButton}
              onPress={() => pickImage('library')}
            >
              <Text style={styles.photoButtonText}>🖼️ اختر صورة</Text>
            </TouchableOpacity>
            
            <TouchableOpacity 
              style={styles.photoButton}
              onPress={() => pickImage('camera')}
            >
              <Text style={styles.photoButtonText}>📷 التقط صورة</Text>
            </TouchableOpacity>
          </View>
          
          {childPhoto && (
            <View style={styles.photoPreviewContainer}>
              <Image source={{ uri: childPhoto }} style={styles.childPhoto} />
              <TouchableOpacity 
                style={styles.removePhotoButton}
                onPress={() => setChildPhoto(null)}
              >
                <Text style={styles.removePhotoText}>❌ حذف الصورة</Text>
              </TouchableOpacity>
            </View>
          )}
        </View>

        <View style={styles.buttonContainer}>
          <TouchableOpacity
            style={[styles.submitButton, (!name || !age || !gender) && styles.disabledButton]}
            disabled={!name || !age || !gender}
            onPress={handleSubmit}
          >
            <Text style={styles.submitButtonText}>اختر قصة ممتعة 🚀</Text>
          </TouchableOpacity>
          
          <TouchableOpacity
            style={styles.backButton}
            onPress={() => navigation.goBack()}
          >
            <Text style={styles.backButtonText}>↩️ العودة لاختيار اللغة</Text>
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
  formContainer: {
    flex: 1,
    padding: 20,
  },
  title: {
    fontSize: 28,
    fontWeight: 'bold',
    textAlign: 'center',
    marginBottom: 30,
    color: '#2C3E50',
  },
  inputGroup: {
    marginBottom: 25,
  },
  label: {
    fontSize: 16,
    fontWeight: '600',
    color: '#2C3E50',
    marginBottom: 8,
    textAlign: 'right',
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
  genderContainer: {
    flexDirection: 'row',
    justifyContent: 'space-around',
    marginTop: 10,
  },
  genderOption: {
    paddingVertical: 15,
    paddingHorizontal: 30,
    borderRadius: 12,
    borderWidth: 2,
    borderColor: '#D6DBDF',
    backgroundColor: '#F8F9F9',
    alignItems: 'center',
    minWidth: 120,
  },
  activeGender: {
    backgroundColor: '#4A90E2',
    borderColor: '#4A90E2',
  },
  genderText: {
    fontSize: 18,
    fontWeight: '600',
    color: '#5D6D7E',
  },
  activeGenderText: {
    color: '#FFFFFF',
  },
  photoButtonsContainer: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    marginTop: 10,
  },
  photoButton: {
    flex: 1,
    backgroundColor: '#2196F3',
    padding: 15,
    borderRadius: 12,
    alignItems: 'center',
    marginHorizontal: 5,
  },
  photoButtonText: {
    color: '#fff',
    fontSize: 16,
    fontWeight: '600',
  },
  photoPreviewContainer: {
    alignItems: 'center',
    marginTop: 15,
  },
  childPhoto: {
    width: 150,
    height: 150,
    borderRadius: 75,
    borderWidth: 3,
    borderColor: '#4A90E2',
    marginBottom: 10,
  },
  removePhotoButton: {
    backgroundColor: '#FF6B6B',
    paddingHorizontal: 20,
    paddingVertical: 10,
    borderRadius: 8,
  },
  removePhotoText: {
    color: '#fff',
    fontSize: 14,
    fontWeight: '600',
  },
  buttonContainer: {
    marginTop: 20,
  },
  submitButton: {
    backgroundColor: '#4A90E2',
    padding: 18,
    borderRadius: 15,
    alignItems: 'center',
    shadowColor: '#4A90E2',
    shadowOffset: { width: 0, height: 3 },
    shadowOpacity: 0.3,
    shadowRadius: 5,
    elevation: 5,
    marginBottom: 15,
  },
  disabledButton: {
    backgroundColor: '#AAB7B8',
    shadowOpacity: 0,
  },
  submitButtonText: {
    color: '#fff',
    fontSize: 18,
    fontWeight: 'bold',
  },
  backButton: {
    padding: 12,
    alignItems: 'center',
  },
  backButtonText: {
    color: '#5D6D7E',
    fontSize: 14,
    textAlign: 'center',
  },
});
