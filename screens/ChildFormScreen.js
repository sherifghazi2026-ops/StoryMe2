import React, { useState } from 'react';
import {
  View,
  Text,
  TextInput,
  TouchableOpacity,
  StyleSheet,
  ScrollView,
  Alert
} from 'react-native';

export default function ChildFormScreen({ route, navigation }) {
  const { story } = route.params || {};
  const [childName, setChildName] = useState('');
  const [childAge, setChildAge] = useState('');
  const [favoriteColor, setFavoriteColor] = useState('');

  const handleSubmit = () => {
    if (!childName.trim() || !childAge.trim()) {
      Alert.alert('خطأ', 'يرجى ملء جميع الحقول المطلوبة');
      return;
    }

    Alert.alert(
      'تم الحفظ!',
      `تم إضافة ${childName} بنجاح للقصة "${story?.title || 'غير معروفة'}"`,
      [
        {
          text: 'موافق',
          onPress: () => navigation.goBack()
        }
      ]
    );
  };

  return (
    <ScrollView style={styles.container}>
      <View style={styles.header}>
        <Text style={styles.title}>إضافة طفل للقصة</Text>
        {story && (
          <Text style={styles.storyTitle}>القصة: {story.title}</Text>
        )}
      </View>

      <View style={styles.form}>
        <View style={styles.inputGroup}>
          <Text style={styles.label}>اسم الطفل *</Text>
          <TextInput
            style={styles.input}
            value={childName}
            onChangeText={setChildName}
            placeholder="أدخل اسم الطفل"
            placeholderTextColor="#999"
          />
        </View>

        <View style={styles.inputGroup}>
          <Text style={styles.label}>عمر الطفل *</Text>
          <TextInput
            style={styles.input}
            value={childAge}
            onChangeText={setChildAge}
            placeholder="أدخل العمر"
            placeholderTextColor="#999"
            keyboardType="numeric"
          />
        </View>

        <View style={styles.inputGroup}>
          <Text style={styles.label}>اللون المفضل</Text>
          <TextInput
            style={styles.input}
            value={favoriteColor}
            onChangeText={setFavoriteColor}
            placeholder="أدخل اللون المفضل"
            placeholderTextColor="#999"
          />
        </View>

        <View style={styles.buttonContainer}>
          <TouchableOpacity
            style={[styles.button, styles.submitButton]}
            onPress={handleSubmit}
          >
            <Text style={styles.buttonText}>حفظ الطفل</Text>
          </TouchableOpacity>

          <TouchableOpacity
            style={[styles.button, styles.cancelButton]}
            onPress={() => navigation.goBack()}
          >
            <Text style={styles.buttonText}>إلغاء</Text>
          </TouchableOpacity>
        </View>
      </View>
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff'
  },
  header: {
    padding: 25,
    backgroundColor: '#4CAF50',
    alignItems: 'center'
  },
  title: {
    fontSize: 24,
    fontWeight: 'bold',
    color: '#fff',
    marginBottom: 10
  },
  storyTitle: {
    fontSize: 16,
    color: '#fff',
    opacity: 0.9
  },
  form: {
    padding: 20
  },
  inputGroup: {
    marginBottom: 20
  },
  label: {
    fontSize: 16,
    fontWeight: '600',
    color: '#333',
    marginBottom: 8,
    textAlign: 'right'
  },
  input: {
    borderWidth: 1,
    borderColor: '#ddd',
    borderRadius: 10,
    padding: 15,
    fontSize: 16,
    textAlign: 'right',
    backgroundColor: '#f9f9f9'
  },
  buttonContainer: {
    marginTop: 30,
    flexDirection: 'row',
    justifyContent: 'space-between'
  },
  button: {
    flex: 1,
    padding: 18,
    borderRadius: 12,
    alignItems: 'center',
    marginHorizontal: 5
  },
  submitButton: {
    backgroundColor: '#2196F3'
  },
  cancelButton: {
    backgroundColor: '#f44336'
  },
  buttonText: {
    color: '#fff',
    fontSize: 16,
    fontWeight: 'bold'
  }
});
