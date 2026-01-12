import React, { useState, useEffect } from 'react';
import {
  View,
  Text,
  StyleSheet,
  Image,
  ScrollView,
  TouchableOpacity,
  Alert
} from 'react-native';
import * as Speech from 'expo-speech';

export default function StoryReaderScreen({ route, navigation, childInfo }) {
  const { story, packId, packTitle } = route.params || {};
  const [partIndex, setPartIndex] = useState(0);
  const [isPlayingAudio, setIsPlayingAudio] = useState(false);

  // إيقاف الكلام عند ترك الشاشة
  useEffect(() => {
    return () => {
      Speech.stop();
      setIsPlayingAudio(false);
    };
  }, []);

  if (!story) {
    return (
      <View style={styles.container}>
        <Text style={styles.errorText}>لم يتم العثور على القصة</Text>
        <TouchableOpacity
          style={styles.backButton}
          onPress={() => navigation.goBack()}
        >
          <Text style={styles.backButtonText}>العودة</Text>
        </TouchableOpacity>
      </View>
    );
  }

  const storyParts = story.storyParts || [];
  const currentPart = storyParts[partIndex] || {};
  const totalParts = storyParts.length;

  const playAudioForStory = async () => {
    try {
      if (isPlayingAudio) {
        await Speech.stop();
        setIsPlayingAudio(false);
        return;
      }

      const storyText = currentPart.text;
      if (!storyText) {
        Alert.alert('خطأ', 'النص غير متوفر');
        return;
      }

      setIsPlayingAudio(true);
      
      await Speech.speak(storyText, {
        language: 'ar-EG', // تغيير اللغة إلى مصرية
        pitch: 1.0,
        rate: 0.75,
        volume: 1.0,
        onDone: () => setIsPlayingAudio(false),
        onStopped: () => setIsPlayingAudio(false),
        onError: (error) => {
          console.error('Speech error:', error);
          setIsPlayingAudio(false);
          Alert.alert('خطأ', 'تعذر تشغيل الصوت');
        }
      });
      
    } catch (error) {
      console.error('Error playing audio:', error);
      setIsPlayingAudio(false);
      Alert.alert('خطأ', 'حدث خطأ أثناء تشغيل الصوت');
    }
  };

  const handleNext = () => {
    if (partIndex < totalParts - 1) {
      Speech.stop();
      setIsPlayingAudio(false);
      setPartIndex(partIndex + 1);
    } else {
      Speech.stop();
      setIsPlayingAudio(false);
      navigation.navigate('StoryEnd', { story, packTitle });
    }
  };

  const handlePrevious = () => {
    if (partIndex > 0) {
      Speech.stop();
      setIsPlayingAudio(false);
      setPartIndex(partIndex - 1);
    }
  };

  return (
    <View style={styles.container}>
      {/* الهيدر */}
      <View style={styles.header}>
        <View style={styles.headerLeft}>
          <TouchableOpacity
            style={styles.backButton}
            onPress={() => navigation.goBack()}
          >
            <Text style={styles.backButtonText}>↩️</Text>
          </TouchableOpacity>
        </View>
        
        <View style={styles.headerCenter}>
          <Text style={styles.storyTitle} numberOfLines={1}>
            {story.title}
          </Text>
          <Text style={styles.pageIndicator}>
            {partIndex + 1} / {totalParts}
          </Text>
        </View>
        
        <View style={styles.headerRight}>
          {childInfo?.name && (
            <Text style={styles.readerName}>{childInfo.name}</Text>
          )}
        </View>
      </View>
      
      {/* المحتوى */}
      <ScrollView style={styles.content}>
        <View style={styles.storyContent}>
          {/* زر الصوت */}
          <TouchableOpacity 
            style={[
              styles.audioButton,
              isPlayingAudio && styles.audioButtonActive
            ]}
            onPress={playAudioForStory}
          >
            <Text style={styles.audioButtonText}>
              {isPlayingAudio ? '⏸️ إيقاف' : '▶️ استمع للقصة'}
            </Text>
          </TouchableOpacity>
          
          {/* الصورة */}
          {currentPart.image && (
            <Image 
              source={{ uri: currentPart.image }} 
              style={styles.storyImage} 
              resizeMode="cover"
            />
          )}
          
          {/* نص القصة */}
          <Text style={styles.storyText}>
            {currentPart.text}
          </Text>
        </View>
      </ScrollView>
      
      {/* أزرار التنقل */}
      <View style={styles.navigationContainer}>
        <TouchableOpacity
          style={[
            styles.navButton,
            styles.prevButton,
            partIndex === 0 && styles.disabledNavButton
          ]}
          onPress={handlePrevious}
          disabled={partIndex === 0}
        >
          <Text style={styles.navButtonText}>⏪ السابق</Text>
        </TouchableOpacity>
        
        <TouchableOpacity
          style={[
            styles.navButton,
            styles.nextButton
          ]}
          onPress={handleNext}
        >
          <Text style={styles.navButtonText}>
            {partIndex < totalParts - 1 ? '⏩ التالي' : '🏁 انتهاء'}
          </Text>
        </TouchableOpacity>
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
  },
  header: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    padding: 15,
    backgroundColor: '#4A90E2',
    borderBottomLeftRadius: 20,
    borderBottomRightRadius: 20,
    elevation: 5,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
  },
  headerLeft: {
    width: 60,
  },
  headerCenter: {
    flex: 1,
    alignItems: 'center',
  },
  headerRight: {
    width: 60,
    alignItems: 'flex-end',
  },
  storyTitle: {
    fontSize: 18,
    fontWeight: 'bold',
    color: '#fff',
    textAlign: 'center',
  },
  pageIndicator: {
    fontSize: 14,
    color: 'rgba(255, 255, 255, 0.8)',
    marginTop: 4,
  },
  readerName: {
    fontSize: 12,
    color: 'rgba(255, 255, 255, 0.8)',
    fontStyle: 'italic',
  },
  backButton: {
    padding: 8,
  },
  backButtonText: {
    fontSize: 20,
    color: '#fff',
  },
  content: {
    flex: 1,
  },
  storyContent: {
    padding: 20,
  },
  audioButton: {
    backgroundColor: '#FF9800',
    padding: 15,
    borderRadius: 12,
    alignItems: 'center',
    marginBottom: 20,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.2,
    shadowRadius: 3,
    elevation: 3,
  },
  audioButtonActive: {
    backgroundColor: '#FF6B6B',
  },
  audioButtonText: {
    color: '#fff',
    fontSize: 16,
    fontWeight: 'bold',
  },
  storyImage: {
    width: '100%',
    height: 200,
    borderRadius: 15,
    marginBottom: 20,
    backgroundColor: '#f5f5f5',
  },
  storyText: {
    fontSize: 20,
    lineHeight: 34,
    color: '#2C3E50',
    textAlign: 'right',
    marginBottom: 20,
  },
  navigationContainer: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    padding: 20,
    backgroundColor: '#fff',
    borderTopWidth: 1,
    borderTopColor: '#eee',
  },
  navButton: {
    flex: 1,
    padding: 15,
    borderRadius: 12,
    alignItems: 'center',
    marginHorizontal: 10,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 3,
    elevation: 2,
  },
  prevButton: {
    backgroundColor: '#95A5A6',
  },
  nextButton: {
    backgroundColor: '#4A90E2',
  },
  disabledNavButton: {
    backgroundColor: '#D6DBDF',
    opacity: 0.5,
  },
  navButtonText: {
    color: '#fff',
    fontSize: 16,
    fontWeight: 'bold',
  },
  errorText: {
    fontSize: 18,
    color: 'red',
    textAlign: 'center',
    marginTop: 100,
  },
});
