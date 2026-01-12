import React from 'react';
import {
  View,
  Text,
  TouchableOpacity,
  StyleSheet,
  Image
} from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

export default function StoryEndScreen({ navigation, route, childInfo }) {
  const { story, packTitle } = route.params || {};

  const handleNewStory = () => {
    navigation.goBack();
  };

  const handleGoHome = () => {
    navigation.navigate('StoryLibrary');
  };

  return (
    <SafeAreaView style={styles.container}>
      <View style={styles.endContainer}>
        <Text style={styles.endTitle}>🏁 أحسنت! انتهيت من القصة</Text>
        
        {childInfo?.photo ? (
          <Image source={{ uri: childInfo.photo }} style={styles.endProfilePhoto} />
        ) : (
          <View style={styles.endDefaultProfileIcon}>
            <Text style={styles.endDefaultIconText}>
              {childInfo?.gender === 'ولد' ? '👦' : '👧'}
            </Text>
          </View>
        )}
        
        <Image 
          source={{ uri: "https://img.freepik.com/free-vector/happy-kids-celebrating_1308-195.jpg" }} 
          style={styles.endImage} 
          resizeMode="contain"
        />
        
        <Text style={styles.endMessage}>
          {childInfo?.name} العزيز{childInfo?.gender === 'بنت' ? 'ة' : ''}،
          أكملت قصة "{story?.title || 'القصة'}" بنجاح! 🎉
        </Text>
        
        {packTitle && (
          <Text style={styles.packInfo}>من باقة: {packTitle}</Text>
        )}
        
        {/* عرض الدروس المستفادة */}
        {story?.lessons && story.lessons.length > 0 && (
          <View style={styles.lessonsCard}>
            <Text style={styles.lessonsTitle}>الدروس المستفادة من القصة:</Text>
            {story.lessons.map((lesson, index) => (
              <View key={index} style={styles.lessonRow}>
                <Text style={styles.lessonBullet}>•</Text>
                <Text style={styles.lessonText}>{lesson}</Text>
              </View>
            ))}
          </View>
        )}
        
        <View style={styles.endButtons}>
          <TouchableOpacity 
            style={[styles.endButton, styles.newStoryButton]}
            onPress={handleNewStory}
          >
            <Text style={styles.endButtonText}>📖 قراءة قصة أخرى</Text>
          </TouchableOpacity>
          
          <TouchableOpacity 
            style={[styles.endButton, styles.homeButton]}
            onPress={handleGoHome}
          >
            <Text style={styles.endButtonText}>🏠 المكتبة الرئيسية</Text>
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
  endContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    padding: 30,
  },
  endTitle: {
    fontSize: 30,
    fontWeight: 'bold',
    color: '#2C3E50',
    marginBottom: 30,
    textAlign: 'center',
  },
  endProfilePhoto: {
    width: 130,
    height: 130,
    borderRadius: 65,
    marginBottom: 20,
    borderWidth: 4,
    borderColor: '#4A90E2',
  },
  endDefaultProfileIcon: {
    width: 130,
    height: 130,
    borderRadius: 65,
    backgroundColor: '#4A90E2',
    justifyContent: 'center',
    alignItems: 'center',
    marginBottom: 20,
    borderWidth: 4,
    borderColor: '#FFFFFF',
  },
  endDefaultIconText: {
    fontSize: 45,
    color: '#FFFFFF',
  },
  endImage: {
    width: '80%',
    height: 200,
    marginBottom: 30,
    borderRadius: 15,
  },
  endMessage: {
    fontSize: 20,
    color: '#2C3E50',
    textAlign: 'center',
    lineHeight: 32,
    marginBottom: 10,
    fontWeight: '500',
  },
  packInfo: {
    fontSize: 16,
    color: '#4A90E2',
    textAlign: 'center',
    marginBottom: 20,
    fontStyle: 'italic',
  },
  lessonsCard: {
    backgroundColor: '#FFFFFF',
    borderRadius: 15,
    padding: 20,
    marginBottom: 30,
    width: '100%',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
    elevation: 3,
  },
  lessonsTitle: {
    fontSize: 18,
    fontWeight: 'bold',
    color: '#2C3E50',
    marginBottom: 15,
    textAlign: 'center',
  },
  lessonRow: {
    flexDirection: 'row',
    alignItems: 'flex-start',
    marginBottom: 8,
  },
  lessonBullet: {
    fontSize: 16,
    color: '#4A90E2',
    marginLeft: 10,
  },
  lessonText: {
    fontSize: 16,
    color: '#5D6D7E',
    flex: 1,
    textAlign: 'right',
  },
  endButtons: {
    flexDirection: 'column',
    justifyContent: 'center',
    width: '100%',
    gap: 15,
  },
  endButton: {
    padding: 15,
    borderRadius: 15,
    alignItems: 'center',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 3 },
    shadowOpacity: 0.2,
    shadowRadius: 5,
    elevation: 4,
    width: '100%',
  },
  newStoryButton: {
    backgroundColor: '#FF6B6B',
  },
  homeButton: {
    backgroundColor: '#4ECDC4',
  },
  endButtonText: {
    color: '#FFFFFF',
    fontSize: 16,
    fontWeight: 'bold',
  },
});
