import React from 'react';
import { 
  View, 
  Text, 
  TouchableOpacity, 
  StyleSheet, 
  Image 
} from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

export default function LanguageScreen({ navigation }) {
  return (
    <SafeAreaView style={styles.container}>
      <View style={styles.languageContainer}>
        <Text style={styles.languageTitle}>اختر اللغة / Choose Language</Text>
        
        <Image 
          source={{ uri: "https://raw.githubusercontent.com/sherifghazi2026-ops/StoryMeApp/refs/heads/main/square-1-1-1767863955346.png" }} 
          style={styles.languageImage} 
          resizeMode="contain"
        />
        
        <View style={styles.languageButtons}>
          <TouchableOpacity
            style={[styles.languageButton, styles.arabicButton]}
            onPress={() => navigation.navigate('Form', { language: 'ar' })}
          >
            <Text style={styles.languageButtonText}>العربية 🇪🇬</Text>
            <Text style={styles.languageButtonSubtext}>قصص الأطفال</Text>
          </TouchableOpacity>
          
          <TouchableOpacity
            style={[styles.languageButton, styles.englishButton]}
            onPress={() => {
              // يمكن إضافة نسخة إنجليزية لاحقاً
              alert('النسخة الإنجليزية قريباً بإذن الله');
            }}
          >
            <Text style={styles.languageButtonText}>English 🇺🇸</Text>
            <Text style={styles.languageButtonSubtext}>Children Stories</Text>
          </TouchableOpacity>
        </View>
        
        <Text style={styles.languageNote}>
          القصص مكتوبة بالعربية الفصحى مع التشكيل الكامل للكلمات لتسهيل النطق
        </Text>
      </View>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#E8F4FD',
  },
  languageContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    padding: 30,
  },
  languageTitle: {
    fontSize: 20,
    fontWeight: 'bold',
    textAlign: 'center',
    marginBottom: 20,
    color: '#2C3E50',
  },
  languageImage: {
    width: '100%',
    height: 250,
    marginBottom: 40,
    borderRadius: 15,
  },
  languageButtons: {
    width: '100%',
    flexDirection: 'column',
    gap: 20,
    marginBottom: 30,
  },
  languageButton: {
    padding: 25,
    borderRadius: 20,
    alignItems: 'center',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.2,
    shadowRadius: 6,
    elevation: 5,
  },
  arabicButton: {
    backgroundColor: '#4A90E2',
  },
  englishButton: {
    backgroundColor: '#FF6B6B',
  },
  languageButtonText: {
    color: '#FFFFFF',
    fontSize: 22,
    fontWeight: 'bold',
    marginBottom: 5,
  },
  languageButtonSubtext: {
    color: 'rgba(255, 255, 255, 0.9)',
    fontSize: 16,
  },
  languageNote: {
    fontSize: 14,
    color: '#5D6D7E',
    textAlign: 'center',
    marginTop: 20,
    fontStyle: 'italic',
  },
});
