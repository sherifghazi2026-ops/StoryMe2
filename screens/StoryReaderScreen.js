import React, { useState, useEffect, useRef } from 'react';
import {
  View,
  Text,
  ScrollView,
  StyleSheet,
  TouchableOpacity,
  SafeAreaView,
  Alert,
  Image,
  Dimensions,
  ActivityIndicator,
} from 'react-native';
import * as Speech from 'expo-speech';
import AsyncStorage from '@react-native-async-storage/async-storage';

const { width, height } = Dimensions.get('window');

const StoryReaderScreen = ({ navigation, route }) => {
  const { story, childData } = route.params;
  const [currentPage, setCurrentPage] = useState(0);
  const [isPlaying, setIsPlaying] = useState(false);
  const [autoPlay, setAutoPlay] = useState(false);
  const [isLoading, setIsLoading] = useState(false);
  const [savedRecordings, setSavedRecordings] = useState([]);
  const speechTimeoutRef = useRef(null);

  // محتوى قصة علبة الألوان (القصة المجانية الوحيدة)
  const storyContent = story.content || [
    {
      text: 'هذه القصة غير متاحة بعد. قم بشراء القصة لقراءتها.',
      image: 'https://img.freepik.com/free-vector/children-reading-books_1308-200.jpg'
    }
  ];

  // تحميل التسجيلات المحفوظة
  useEffect(() => {
    loadSavedRecordings();
  }, []);

  // التأكد من إيقاف الكلام عند ترك الشاشة
  useEffect(() => {
    return () => {
      if (speechTimeoutRef.current) {
        clearTimeout(speechTimeoutRef.current);
      }
      Speech.stop();
      setIsPlaying(false);
    };
  }, []);

  // عند انتهاء الكلام، الانتقال للصفحة التالية إذا كان autoPlay مفعلاً
  useEffect(() => {
    if (autoPlay && !isPlaying && currentPage < storyContent.length - 1) {
      speechTimeoutRef.current = setTimeout(() => {
        setCurrentPage(prev => prev + 1);
        playAudio(currentPage + 1);
      }, 1000);
    }
    
    return () => {
      if (speechTimeoutRef.current) {
        clearTimeout(speechTimeoutRef.current);
      }
    };
  }, [isPlaying, autoPlay, currentPage]);

  const loadSavedRecordings = async () => {
    try {
      const recordings = await AsyncStorage.getItem('storyRecordings');
      if (recordings) {
        const parsed = JSON.parse(recordings);
        const storyRecordings = parsed.filter(r => r.storyId === story.id);
        setSavedRecordings(storyRecordings);
      }
    } catch (error) {
      console.error('Error loading recordings:', error);
    }
  };

  const playAudio = async (pageIndex = currentPage) => {
    try {
      if (isPlaying) {
        await Speech.stop();
        setIsPlaying(false);
        setAutoPlay(false);
        return;
      }

      const text = storyContent[pageIndex]?.text || storyContent[pageIndex];
      if (!text) return;

      setIsLoading(true);
      setIsPlaying(true);
      
      await Speech.speak(text, {
        language: 'ar-SA',
        pitch: 1.0,
        rate: 0.75,
        volume: 1.0,
        onStart: () => setIsLoading(false),
        onDone: () => {
          setIsPlaying(false);
          if (autoPlay && pageIndex < storyContent.length - 1) {
            // الانتقال التلقائي للصفحة التالية
            setTimeout(() => {
              setCurrentPage(pageIndex + 1);
            }, 500);
          }
        },
        onError: () => {
          setIsPlaying(false);
          setIsLoading(false);
        }
      });
    } catch (error) {
      console.error('Error playing audio:', error);
      setIsPlaying(false);
      setIsLoading(false);
      Alert.alert('خطأ', 'حدث خطأ أثناء تشغيل الصوت');
    }
  };

  const playFullStory = async () => {
    if (isPlaying) {
      await Speech.stop();
      setIsPlaying(false);
      setAutoPlay(false);
      return;
    }
    
    setAutoPlay(true);
    await playAudio(currentPage);
  };

  const stopAudio = async () => {
    await Speech.stop();
    setIsPlaying(false);
    setAutoPlay(false);
  };

  const nextPage = () => {
    if (currentPage < storyContent.length - 1) {
      setCurrentPage(currentPage + 1);
      if (autoPlay || isPlaying) {
        stopAudio();
        setTimeout(() => {
          if (autoPlay) {
            playAudio(currentPage + 1);
          }
        }, 300);
      }
    } else {
      showCompletionAlert();
    }
  };

  const prevPage = () => {
    if (currentPage > 0) {
      setCurrentPage(currentPage - 1);
      if (autoPlay || isPlaying) {
        stopAudio();
        setTimeout(() => {
          if (autoPlay) {
            playAudio(currentPage - 1);
          }
        }, 300);
      }
    }
  };

  const showCompletionAlert = () => {
    Alert.alert(
      'تهانينا! 🎉',
      `لقد أنهيت قراءة قصة "${story.title}"`,
      [
        {
          text: 'العودة للمكتبة',
          onPress: () => navigation.navigate('StoryLibrary', { childData })
        },
        {
          text: 'قراءة مرة أخرى',
          onPress: () => {
            setCurrentPage(0);
            setAutoPlay(false);
            stopAudio();
          }
        },
        {
          text: 'تسجيل القصة بصوتي',
          onPress: () => navigation.navigate('Recording', { story, childData })
        }
      ]
    );
  };

  const currentContent = storyContent[currentPage];
  const text = currentContent?.text || currentContent;
  const image = currentContent?.image;

  const formatTime = (seconds) => {
    const mins = Math.floor(seconds / 60);
    const secs = seconds % 60;
    return `${mins.toString().padStart(2, '0')}:${secs.toString().padStart(2, '0')}`;
  };

  return (
    <SafeAreaView style={styles.container}>
      {/* Header مع معلومات الصفحة */}
      <View style={styles.header}>
        <View style={styles.headerContent}>
          <Text style={styles.storyTitle} numberOfLines={1}>
            {story.title}
          </Text>
          <Text style={styles.pageCounter}>
            صفحة {currentPage + 1} من {storyContent.length}
          </Text>
        </View>
      </View>

      <ScrollView 
        style={styles.contentContainer}
        showsVerticalScrollIndicator={false}
      >
        {/* صورة الصفحة إذا موجودة */}
        {image && (
          <Image 
            source={{ uri: image }} 
            style={styles.pageImage} 
            resizeMode="cover"
          />
        )}

        {/* نص الصفحة */}
        <View style={styles.textContainer}>
          <Text style={styles.storyText}>
            {text}
          </Text>
        </View>

        {/* عرض التسجيلات المحفوظة لهذه القصة */}
        {savedRecordings.length > 0 && (
          <View style={styles.recordingsSection}>
            <Text style={styles.recordingsTitle}>🎤 التسجيلات المحفوظة</Text>
            {savedRecordings.slice(0, 3).map((recording) => (
              <View key={recording.id} style={styles.recordingItem}>
                <Text style={styles.recordingText}>
                  تسجيل بواسطة: {recording.childName} • {formatTime(recording.duration)}
                </Text>
                <Text style={recordingDate}>
                  {recording.date} {recording.time}
                </Text>
              </View>
            ))}
          </View>
        )}
      </ScrollView>

      {/* عناصر التحكم */}
      <View style={styles.controls}>
        {/* أزرار التحكم في الصفحات */}
        <View style={styles.pageControls}>
          <TouchableOpacity
            style={[styles.navButton, currentPage === 0 && styles.disabledButton]}
            onPress={prevPage}
            disabled={currentPage === 0}
          >
            <Text style={styles.navButtonText}>⏪ الصفحة السابقة</Text>
          </TouchableOpacity>

          <TouchableOpacity
            style={styles.navButton}
            onPress={nextPage}
          >
            <Text style={styles.navButtonText}>
              {currentPage < storyContent.length - 1 ? 'الصفحة التالية ⏩' : 'إنهاء القصة 🏁'}
            </Text>
          </TouchableOpacity>
        </View>

        {/* أزرار التحكم في الصوت */}
        <View style={styles.audioControls}>
          <TouchableOpacity 
            style={[styles.audioButton, isPlaying && styles.audioButtonActive]}
            onPress={isPlaying ? stopAudio : () => playAudio()}
            disabled={isLoading}
          >
            {isLoading ? (
              <ActivityIndicator color="#FFFFFF" size="small" />
            ) : (
              <Text style={styles.audioButtonText}>
                {isPlaying ? '⏸️ إيقاف الصوت' : '▶️ استمع لهذه الصفحة'}
              </Text>
            )}
          </TouchableOpacity>

          <TouchableOpacity 
            style={[styles.audioButton, styles.fullStoryButton, autoPlay && styles.audioButtonActive]}
            onPress={playFullStory}
            disabled={isLoading}
          >
            {isLoading ? (
              <ActivityIndicator color="#FFFFFF" size="small" />
            ) : (
              <Text style={styles.audioButtonText}>
                {autoPlay ? '⏸️ إيقاف القصة كاملة' : '📖 استمع للقصة كاملة'}
              </Text>
            )}
          </TouchableOpacity>
        </View>

        {/* زر تسجيل الصوت */}
        <TouchableOpacity
          style={styles.recordButton}
          onPress={() => navigation.navigate('Recording', { story, childData })}
        >
          <Text style={styles.recordButtonText}>🎤 سجل القصة بصوتك</Text>
        </TouchableOpacity>

        {/* معلومات القارئ */}
        {childData && (
          <View style={styles.readerInfo}>
            <Text style={styles.readerText}>
              القارئ: {childData.name} ({childData.age} سنة)
            </Text>
          </View>
        )}
      </View>
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff8e1',
  },
  header: {
    backgroundColor: '#4CAF50',
    paddingVertical: 15,
    paddingHorizontal: 20,
    elevation: 4,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.2,
    shadowRadius: 4,
  },
  headerContent: {
    alignItems: 'center',
  },
  storyTitle: {
    fontSize: 22,
    fontWeight: 'bold',
    color: '#FFFFFF',
    textAlign: 'center',
    marginBottom: 5,
  },
  pageCounter: {
    fontSize: 16,
    color: '#E8F5E9',
    textAlign: 'center',
  },
  contentContainer: {
    flex: 1,
  },
  pageImage: {
    width: width,
    height: 250,
    backgroundColor: '#F5F5F5',
  },
  textContainer: {
    padding: 25,
    backgroundColor: '#FFFFFF',
    marginHorizontal: 20,
    marginVertical: 20,
    borderRadius: 20,
    elevation: 3,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 6,
  },
  storyText: {
    fontSize: 22,
    lineHeight: 38,
    color: '#3e2723',
    textAlign: 'right',
    textAlignVertical: 'center',
  },
  recordingsSection: {
    backgroundColor: '#E8F5E9',
    marginHorizontal: 20,
    marginBottom: 20,
    padding: 15,
    borderRadius: 15,
  },
  recordingsTitle: {
    fontSize: 18,
    fontWeight: 'bold',
    color: '#2E7D32',
    marginBottom: 10,
    textAlign: 'right',
  },
  recordingItem: {
    backgroundColor: '#FFFFFF',
    padding: 12,
    borderRadius: 10,
    marginBottom: 8,
  },
  recordingText: {
    fontSize: 14,
    color: '#333',
    textAlign: 'right',
    marginBottom: 5,
  },
  recordingDate: {
    fontSize: 12,
    color: '#666',
    textAlign: 'right',
    fontStyle: 'italic',
  },
  controls: {
    backgroundColor: '#FFFFFF',
    padding: 20,
    borderTopLeftRadius: 25,
    borderTopRightRadius: 25,
    elevation: 8,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: -3 },
    shadowOpacity: 0.1,
    shadowRadius: 10,
  },
  pageControls: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    marginBottom: 15,
  },
  navButton: {
    backgroundColor: '#FF9800',
    paddingHorizontal: 20,
    paddingVertical: 12,
    borderRadius: 12,
    minWidth: width * 0.4,
    alignItems: 'center',
  },
  disabledButton: {
    backgroundColor: '#FFCC80',
    opacity: 0.7,
  },
  navButtonText: {
    color: '#FFFFFF',
    fontSize: 16,
    fontWeight: 'bold',
  },
  audioControls: {
    marginBottom: 15,
    gap: 10,
  },
  audioButton: {
    backgroundColor: '#2196F3',
    padding: 15,
    borderRadius: 12,
    alignItems: 'center',
    justifyContent: 'center',
    minHeight: 50,
  },
  audioButtonActive: {
    backgroundColor: '#F44336',
  },
  fullStoryButton: {
    backgroundColor: '#4CAF50',
  },
  audioButtonText: {
    color: '#FFFFFF',
    fontSize: 16,
    fontWeight: 'bold',
  },
  recordButton: {
    backgroundColor: '#9C27B0',
    padding: 15,
    borderRadius: 12,
    alignItems: 'center',
    marginBottom: 15,
  },
  recordButtonText: {
    color: '#FFFFFF',
    fontSize: 16,
    fontWeight: 'bold',
  },
  readerInfo: {
    alignItems: 'center',
    paddingTop: 10,
    borderTopWidth: 1,
    borderTopColor: '#E0E0E0',
  },
  readerText: {
    fontSize: 14,
    color: '#666',
    fontStyle: 'italic',
  },
});

export default StoryReaderScreen;
