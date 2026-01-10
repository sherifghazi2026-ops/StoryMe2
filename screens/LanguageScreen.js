import React from 'react';
import { 
  StyleSheet, 
  Text, 
  View, 
  Image, 
  TouchableOpacity,
  SafeAreaView,
  Dimensions 
} from 'react-native';

const { width, height } = Dimensions.get('window');

const LanguageScreen = ({ navigation }) => {
  return (
    <SafeAreaView style={styles.container}>
      <View style={styles.content}>
        <Text style={styles.title}>StoryMe 📚</Text>
        <Text style={styles.subtitle}>قصص تفاعلية تعليمية للأطفال</Text>
        
        <Image 
          source={{ uri: "https://raw.githubusercontent.com/sherifghazi2026-ops/StoryMeApp/refs/heads/main/square-1-1-1767863955346.png" }} 
          style={styles.logo} 
          resizeMode="contain"
        />
        
        <View style={styles.languageSection}>
          <Text style={styles.sectionTitle}>اختر اللغة المفضلة</Text>
          
          <TouchableOpacity
            style={styles.languageButton}
            onPress={() => navigation.navigate('Form')}
          >
            <View style={styles.languageContent}>
              <Text style={styles.flag}>🇸🇦</Text>
              <View style={styles.textContainer}>
                <Text style={styles.languageName}>العربية</Text>
                <Text style={styles.languageDesc}>قصص عربية مع التشكيل الكامل</Text>
              </View>
              <Text style={styles.arrow}>→</Text>
            </View>
          </TouchableOpacity>
          
          <TouchableOpacity
            style={[styles.languageButton, styles.disabledButton]}
            onPress={() => {}}
            disabled={true}
          >
            <View style={styles.languageContent}>
              <Text style={styles.flag}>🇺🇸</Text>
              <View style={styles.textContainer}>
                <Text style={styles.languageName}>English</Text>
                <Text style={[styles.languageDesc, styles.comingSoon]}>Coming Soon</Text>
              </View>
              <Text style={styles.arrow}>→</Text>
            </View>
          </TouchableOpacity>
        </View>
        
        <View style={styles.features}>
          <Text style={styles.featuresTitle}>مميزات التطبيق:</Text>
          <View style={styles.featureItem}>
            <Text style={styles.featureIcon}>🎨</Text>
            <Text style={styles.featureText}>قصص تفاعلية مع التشكيل الكامل</Text>
          </View>
          <View style={styles.featureItem}>
            <Text style={styles.featureIcon}>🎤</Text>
            <Text style={styles.featureText}>إمكانية تسجيل القصة بصوتك</Text>
          </View>
          <View style={styles.featureItem}>
            <Text style={styles.featureIcon}>👶</Text>
            <Text style={styles.featureText}>مخصص لكل عمر من 3-12 سنة</Text>
          </View>
        </View>
      </View>
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#4CAF50',
  },
  content: {
    flex: 1,
    backgroundColor: '#fff',
    borderTopLeftRadius: 40,
    borderTopRightRadius: 40,
    paddingHorizontal: 25,
    paddingTop: 40,
    marginTop: height * 0.1,
  },
  title: {
    fontSize: 42,
    fontWeight: 'bold',
    color: '#4CAF50',
    textAlign: 'center',
    marginBottom: 10,
  },
  subtitle: {
    fontSize: 18,
    color: '#666',
    textAlign: 'center',
    marginBottom: 40,
  },
  logo: {
    width: width * 0.7,
    height: width * 0.7,
    alignSelf: 'center',
    marginBottom: 40,
  },
  languageSection: {
    marginBottom: 40,
  },
  sectionTitle: {
    fontSize: 20,
    fontWeight: '600',
    color: '#333',
    marginBottom: 20,
    textAlign: 'right',
  },
  languageButton: {
    backgroundColor: '#f8f9fa',
    borderRadius: 20,
    padding: 20,
    marginBottom: 15,
    borderWidth: 2,
    borderColor: '#E8F5E9',
  },
  disabledButton: {
    opacity: 0.6,
  },
  languageContent: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
  },
  flag: {
    fontSize: 32,
  },
  textContainer: {
    flex: 1,
    marginHorizontal: 15,
  },
  languageName: {
    fontSize: 22,
    fontWeight: 'bold',
    color: '#333',
    textAlign: 'right',
  },
  languageDesc: {
    fontSize: 14,
    color: '#666',
    textAlign: 'right',
    marginTop: 5,
  },
  comingSoon: {
    color: '#FF9800',
    fontWeight: '600',
  },
  arrow: {
    fontSize: 24,
    color: '#4CAF50',
    fontWeight: 'bold',
  },
  features: {
    backgroundColor: '#F0F9FF',
    borderRadius: 20,
    padding: 25,
  },
  featuresTitle: {
    fontSize: 18,
    fontWeight: 'bold',
    color: '#2196F3',
    marginBottom: 15,
    textAlign: 'right',
  },
  featureItem: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: 12,
  },
  featureIcon: {
    fontSize: 20,
    marginLeft: 10,
  },
  featureText: {
    fontSize: 15,
    color: '#555',
    flex: 1,
    textAlign: 'right',
  },
});

export default LanguageScreen;
