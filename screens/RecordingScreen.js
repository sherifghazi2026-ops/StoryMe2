import React, { useState, useEffect, useRef } from 'react';
import {
  View,
  Text,
  StyleSheet,
  TouchableOpacity,
  SafeAreaView,
  Alert,
  ActivityIndicator,
  Image,
  ScrollView,
  Dimensions,
} from 'react-native';
import { Audio } from 'expo-av';
import AsyncStorage from '@react-native-async-storage/async-storage';
import * as Sharing from 'expo-sharing';

const { width } = Dimensions.get('window');

const RecordingScreen = ({ navigation, route }) => {
  const { story, childData } = route.params || {};
  const [recording, setRecording] = useState(null);
  const [recordings, setRecordings] = useState([]);
  const [isRecording, setIsRecording] = useState(false);
  const [recordingTime, setRecordingTime] = useState(0);
  const [isPlaying, setIsPlaying] = useState(false);
  const [currentSound, setCurrentSound] = useState(null);
  const [isLoading, setIsLoading] = useState(false);
  const timerRef = useRef(null);
  const soundRef = useRef(null);

  // تحميل التسجيلات المحفوظة
  useEffect(() => {
    loadRecordings();
  }, []);

  // تنظيف عند الخروج
  useEffect(() => {
    return () => {
      if (soundRef.current) {
        soundRef.current.unloadAsync();
      }
      if (timerRef.current) {
        clearInterval(timerRef.current);
      }
    };
  }, []);

  const loadRecordings = async () => {
    try {
      const savedRecordings = await AsyncStorage.getItem('storyRecordings');
      if (savedRecordings) {
        setRecordings(JSON.parse(savedRecordings));
      }
    } catch (error) {
      console.error('Error loading recordings:', error);
    }
  };

  const saveRecordings = async (newRecordings) => {
    try {
      await AsyncStorage.setItem('storyRecordings', JSON.stringify(newRecordings));
    } catch (error) {
      console.error('Error saving recordings:', error);
    }
  };

  const startRecording = async () => {
    try {
      setIsLoading(true);
      const { status } = await Audio.requestPermissionsAsync();
      
      if (status !== 'granted') {
        Alert.alert('صلاحية الميكروفون', 'نحتاج صلاحية الميكروفون للتسجيل');
        setIsLoading(false);
        return;
      }

      await Audio.setAudioModeAsync({
        allowsRecordingIOS: true,
        playsInSilentModeIOS: true,
        staysActiveInBackground: false,
        shouldDuckAndroid: true,
        playThroughEarpieceAndroid: false,
      });

      const { recording } = await Audio.Recording.createAsync(
        Audio.RecordingOptionsPresets.HIGH_QUALITY
      );

      setRecording(recording);
      setIsRecording(true);
      setRecordingTime(0);
      setIsLoading(false);

      // بدء عداد الوقت
      timerRef.current = setInterval(() => {
        setRecordingTime(prev => prev + 1);
      }, 1000);
    } catch (error) {
      console.error('Error starting recording:', error);
      Alert.alert('خطأ', 'حدث خطأ أثناء بدء التسجيل');
      setIsLoading(false);
    }
  };

  const stopRecording = async () => {
    if (!recording) return;

    try {
      setIsRecording(false);
      if (timerRef.current) {
        clearInterval(timerRef.current);
      }

      await recording.stopAndUnloadAsync();
      await Audio.setAudioModeAsync({
        allowsRecordingIOS: false,
      });

      const uri = recording.getURI();
      const newRecording = {
        id: Date.now().toString(),
        uri,
        storyId: story?.id || 'unknown',
        storyTitle: story?.title || 'تسجيل عام',
        duration: recordingTime,
        date: new Date().toLocaleDateString('ar-SA'),
        time: new Date().toLocaleTimeString('ar-SA', { hour: '2-digit', minute: '2-digit' }),
        childName: childData?.name || 'غير معروف',
        childAge: childData?.age || 'غير معروف',
        timestamp: Date.now(),
      };

      const updatedRecordings = [newRecording, ...recordings.slice(0, 19)]; // حفظ آخر 20 تسجيل
      setRecordings(updatedRecordings);
      await saveRecordings(updatedRecordings);

      setRecording(null);
      setRecordingTime(0);

      Alert.alert(
        '🎉 تم التسجيل بنجاح!',
        `تم حفظ التسجيل بنجاح (${recordingTime} ثانية)\nيمكنك الاستماع إليه الآن أو مشاركته`,
        [
          { 
            text: 'حسناً', 
            style: 'default',
            onPress: () => loadRecordings()
          },
          { 
            text: 'الاستماع الآن', 
            onPress: () => playRecording(newRecording)
          }
        ]
      );
    } catch (error) {
      console.error('Error stopping recording:', error);
      Alert.alert('خطأ', 'حدث خطأ أثناء إيقاف التسجيل');
    }
  };

  const playRecording = async (recordingItem) => {
    try {
      if (soundRef.current) {
        await soundRef.current.unloadAsync();
      }

      setIsLoading(true);
      const { sound } = await Audio.Sound.createAsync(
        { uri: recordingItem.uri },
        { 
          shouldPlay: true,
          volume: 1.0,
          rate: 1.0,
        }
      );

      soundRef.current = sound;
      setIsPlaying(true);
      setIsLoading(false);

      sound.setOnPlaybackStatusUpdate((status) => {
        if (status.didJustFinish) {
          setIsPlaying(false);
        }
      });
    } catch (error) {
      console.error('Error playing recording:', error);
      Alert.alert('خطأ', 'حدث خطأ أثناء تشغيل التسجيل');
      setIsLoading(false);
    }
  };

  const stopPlaying = async () => {
    if (soundRef.current) {
      await soundRef.current.stopAsync();
      await soundRef.current.unloadAsync();
      soundRef.current = null;
      setIsPlaying(false);
    }
  };

  const deleteRecording = async (id) => {
    Alert.alert(
      'حذف التسجيل',
      'هل أنت متأكد من حذف هذا التسجيل؟',
      [
        { text: 'إلغاء', style: 'cancel' },
        { 
          text: 'حذف', 
          style: 'destructive',
          onPress: async () => {
            const updatedRecordings = recordings.filter(r => r.id !== id);
            setRecordings(updatedRecordings);
            await saveRecordings(updatedRecordings);
            Alert.alert('تم الحذف', 'تم حذف التسجيل بنجاح');
          }
        },
      ]
    );
  };

  const shareRecording = async (recordingItem) => {
    try {
      if (!(await Sharing.isAvailableAsync())) {
        Alert.alert('مشاركة غير متاحة', 'خاصية المشاركة غير متاحة على جهازك');
        return;
      }

      await Sharing.shareAsync(recordingItem.uri, {
        mimeType: 'audio/m4a',
        dialogTitle: `تسجيل قصة: ${recordingItem.storyTitle}`,
        UTI: 'public.audio'
      });
    } catch (error) {
      console.error('Error sharing recording:', error);
      Alert.alert('خطأ', 'حدث خطأ أثناء مشاركة التسجيل');
    }
  };

  const formatTime = (seconds) => {
    const mins = Math.floor(seconds / 60);
    const secs = seconds % 60;
    return `${mins.toString().padStart(2, '0')}:${secs.toString().padStart(2, '0')}`;
  };

  const formatDate = (dateString) => {
    const date = new Date(dateString);
    return date.toLocaleDateString('ar-SA');
  };

  return (
    <SafeAreaView style={styles.container}>
      <ScrollView showsVerticalScrollIndicator={false}>
        <View style={styles.header}>
          <Text style={styles.title}>🎤 تسجيل القصة</Text>
          <Text style={styles.subtitle}>
            سجل قراءة القصة بصوتك واحفظها للاستماع لاحقاً
          </Text>
        </View>

        {/* معلومات القصة */}
        {story && (
          <View style={styles.storyInfo}>
            {story.image && (
              <Image source={{ uri: story.image }} style={styles.storyImage} />
            )}
            <Text style={styles.storyTitle}>{story.title}</Text>
            <Text style={styles.storyDesc}>سجل قراءة هذه القصة بصوتك</Text>
          </View>
        )}

        {/* منطقة التسجيل */}
        <View style={styles.recordingSection}>
          <View style={styles.micContainer}>
            {isRecording ? (
              <View style={styles.recordingAnimation}>
                <View style={[styles.pulse, styles.pulse1]} />
                <View style={[styles.pulse, styles.pulse2]} />
                <View style={[styles.pulse, styles.pulse3]} />
                <Text style={styles.micIcon}>🎤</Text>
              </View>
            ) : (
              <Text style={styles.micIcon}>🎤</Text>
            )}
          </View>

          <Text style={styles.timer}>{formatTime(recordingTime)}</Text>

          <View style={styles.recordingControls}>
            {isLoading ? (
              <ActivityIndicator size="large" color="#FF5252" />
            ) : !isRecording ? (
              <TouchableOpacity
                style={styles.recordButton}
                onPress={startRecording}
              >
                <Text style={styles.recordButtonText}>● بدء التسجيل</Text>
              </TouchableOpacity>
            ) : (
              <TouchableOpacity
                style={styles.stopButton}
                onPress={stopRecording}
              >
                <Text style={styles.stopButtonText}>⏹︎ إيقاف التسجيل</Text>
              </TouchableOpacity>
            )}
          </View>

          {isRecording && (
            <Text style={styles.recordingStatus}>● جاري التسجيل...</Text>
          )}
        </View>

        {/* نصائح للتسجيل */}
        <View style={styles.tips}>
          <Text style={styles.tipsTitle}>💡 نصائح للتسجيل:</Text>
          <Text style={styles.tip}>• اختر مكاناً هادئاً بعيداً عن الضوضاء</Text>
          <Text style={styles.tip}>• تحدث بوضوح وبطء مناسب</Text>
          <Text style={styles.tip}>• أمسك الهاتف على بعد مناسب من فمك</Text>
          <Text style={styles.tip}>• يمكنك إعادة التسجيل عدة مرات للحصول على أفضل نتيجة</Text>
        </View>

        {/* قائمة التسجيلات السابقة */}
        {recordings.length > 0 && (
          <View style={styles.recordingsList}>
            <Text style={styles.recordingsTitle}>📁 التسجيلات المحفوظة ({recordings.length})</Text>
            <Text style={styles.recordingsSubtitle}>آخر التسجيلات لهذه القصة</Text>
            
            {recordings
              .filter(rec => rec.storyId === story?.id)
              .slice(0, 5)
              .map((rec) => (
                <View key={rec.id} style={styles.recordingItem}>
                  <View style={styles.recordingInfo}>
                    <Text style={styles.recordingName} numberOfLines={1}>
                      {rec.childName} - {rec.storyTitle}
                    </Text>
                    <Text style={styles.recordingDetails}>
                      {formatTime(rec.duration)} • {rec.date} • {rec.time}
                    </Text>
                  </View>
                  <View style={styles.recordingActions}>
                    <TouchableOpacity
                      style={styles.playButton}
                      onPress={() => isPlaying ? stopPlaying() : playRecording(rec)}
                    >
                      <Text style={styles.playButtonText}>
                        {isPlaying ? '⏸️' : '▶️'}
                      </Text>
                    </TouchableOpacity>
                    <TouchableOpacity
                      style={styles.shareButton}
                      onPress={() => shareRecording(rec)}
                    >
                      <Text style={styles.shareButtonText}>↗️</Text>
                    </TouchableOpacity>
                    <TouchableOpacity
                      style={styles.deleteButton}
                      onPress={() => deleteRecording(rec.id)}
                    >
                      <Text style={styles.deleteButtonText}>🗑️</Text>
                    </TouchableOpacity>
                  </View>
                </View>
              ))}
          </View>
        )}

        {/* معلومات التخزين */}
        <View style={styles.storageInfo}>
          <Text style={styles.storageTitle}>💾 معلومات التخزين:</Text>
          <Text style={styles.storageText}>
            • التسجيلات محفوظة على جهازك فقط
          </Text>
          <Text style={styles.storageText}>
            • يمكنك مشاركة التسجيلات مع الآخرين
          </Text>
          <Text style={styles.storageText}>
            • السعة التخزينية: {recordings.length} من 20 تسجيل
          </Text>
        </View>
      </ScrollView>
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#F8F9FA',
  },
  header: {
    alignItems: 'center',
    paddingVertical: 25,
    paddingHorizontal: 20,
    backgroundColor: '#4CAF50',
    borderBottomLeftRadius: 30,
    borderBottomRightRadius: 30,
  },
  title: {
    fontSize: 32,
    fontWeight: 'bold',
    color: '#FFFFFF',
    marginBottom: 8,
    textAlign: 'center',
  },
  subtitle: {
    fontSize: 16,
    color: 'rgba(255, 255, 255, 0.9)',
    textAlign: 'center',
    lineHeight: 22,
    maxWidth: '90%',
  },
  storyInfo: {
    alignItems: 'center',
    padding: 20,
    backgroundColor: '#FFFFFF',
    marginHorizontal: 20,
    marginTop: 20,
    borderRadius: 20,
    elevation: 4,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 3 },
    shadowOpacity: 0.15,
    shadowRadius: 8,
  },
  storyImage: {
    width: 100,
    height: 100,
    borderRadius: 15,
    marginBottom: 15,
  },
  storyTitle: {
    fontSize: 22,
    fontWeight: 'bold',
    color: '#2E7D32',
    marginBottom: 5,
    textAlign: 'center',
  },
  storyDesc: {
    fontSize: 15,
    color: '#555',
    textAlign: 'center',
  },
  recordingSection: {
    backgroundColor: '#FFFFFF',
    borderRadius: 25,
    padding: 30,
    alignItems: 'center',
    marginHorizontal: 20,
    marginTop: 20,
    elevation: 6,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.2,
    shadowRadius: 12,
  },
  micContainer: {
    marginBottom: 25,
    position: 'relative',
  },
  recordingAnimation: {
    position: 'relative',
    alignItems: 'center',
    justifyContent: 'center',
  },
  pulse: {
    position: 'absolute',
    width: 120,
    height: 120,
    borderRadius: 60,
    backgroundColor: 'rgba(255, 0, 0, 0.2)',
  },
  pulse1: {
    animationKeyframes: {
      '0%': { transform: [{ scale: 0.8 }], opacity: 0.8 },
      '100%': { transform: [{ scale: 1.5 }], opacity: 0 },
    },
    animationDuration: '1500ms',
    animationIterationCount: 'infinite',
  },
  pulse2: {
    animationKeyframes: {
      '0%': { transform: [{ scale: 0.8 }], opacity: 0.6 },
      '100%': { transform: [{ scale: 1.8 }], opacity: 0 },
    },
    animationDuration: '2000ms',
    animationIterationCount: 'infinite',
  },
  pulse3: {
    animationKeyframes: {
      '0%': { transform: [{ scale: 0.8 }], opacity: 0.4 },
      '100%': { transform: [{ scale: 2.1 }], opacity: 0 },
    },
    animationDuration: '2500ms',
    animationIterationCount: 'infinite',
  },
  micIcon: {
    fontSize: 70,
  },
  timer: {
    fontSize: 48,
    fontWeight: 'bold',
    color: '#333',
    fontFamily: 'monospace',
    marginBottom: 25,
    letterSpacing: 2,
  },
  recordingControls: {
    marginBottom: 15,
    minHeight: 60,
    justifyContent: 'center',
  },
  recordButton: {
    backgroundColor: '#FF5252',
    paddingHorizontal: 50,
    paddingVertical: 18,
    borderRadius: 35,
    elevation: 5,
    shadowColor: '#FF5252',
    shadowOffset: { width: 0, height: 3 },
    shadowOpacity: 0.4,
    shadowRadius: 6,
  },
  recordButtonText: {
    color: '#FFFFFF',
    fontSize: 20,
    fontWeight: 'bold',
    letterSpacing: 1,
  },
  stopButton: {
    backgroundColor: '#4CAF50',
    paddingHorizontal: 50,
    paddingVertical: 18,
    borderRadius: 35,
    elevation: 5,
    shadowColor: '#4CAF50',
    shadowOffset: { width: 0, height: 3 },
    shadowOpacity: 0.4,
    shadowRadius: 6,
  },
  stopButtonText: {
    color: '#FFFFFF',
    fontSize: 20,
    fontWeight: 'bold',
    letterSpacing: 1,
  },
  recordingStatus: {
    color: '#FF5252',
    fontSize: 18,
    fontWeight: 'bold',
    marginTop: 10,
    backgroundColor: '#FFF5F5',
    paddingHorizontal: 20,
    paddingVertical: 8,
    borderRadius: 20,
  },
  tips: {
    backgroundColor: '#FFF3E0',
    borderRadius: 20,
    padding: 25,
    marginHorizontal: 20,
    marginTop: 25,
    marginBottom: 20,
  },
  tipsTitle: {
    fontSize: 20,
    fontWeight: 'bold',
    color: '#E65100',
    marginBottom: 15,
    textAlign: 'right',
  },
  tip: {
    fontSize: 15,
    color: '#666',
    marginBottom: 10,
    textAlign: 'right',
    lineHeight: 22,
  },
  recordingsList: {
    backgroundColor: '#FFFFFF',
    borderRadius: 20,
    padding: 25,
    marginHorizontal: 20,
    marginBottom: 20,
    elevation: 4,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 3 },
    shadowOpacity: 0.15,
    shadowRadius: 8,
  },
  recordingsTitle: {
    fontSize: 22,
    fontWeight: 'bold',
    color: '#333',
    marginBottom: 5,
    textAlign: 'right',
  },
  recordingsSubtitle: {
    fontSize: 14,
    color: '#666',
    marginBottom: 20,
    textAlign: 'right',
  },
  recordingItem: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: '#F8F9FA',
    padding: 18,
    borderRadius: 15,
    marginBottom: 12,
    borderLeftWidth: 4,
    borderLeftColor: '#4CAF50',
    elevation: 2,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.1,
    shadowRadius: 2,
  },
  recordingInfo: {
    flex: 1,
    marginRight: 15,
  },
  recordingName: {
    fontSize: 16,
    fontWeight: '600',
    color: '#333',
    marginBottom: 6,
    textAlign: 'right',
  },
  recordingDetails: {
    fontSize: 13,
    color: '#666',
    textAlign: 'right',
  },
  recordingActions: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 10,
  },
  playButton: {
    backgroundColor: '#2196F3',
    width: 45,
    height: 45,
    borderRadius: 22.5,
    justifyContent: 'center',
    alignItems: 'center',
  },
  playButtonText: {
    color: '#FFFFFF',
    fontSize: 18,
  },
  shareButton: {
    backgroundColor: '#FF9800',
    width: 45,
    height: 45,
    borderRadius: 22.5,
    justifyContent: 'center',
    alignItems: 'center',
  },
  shareButtonText: {
    color: '#FFFFFF',
    fontSize: 18,
  },
  deleteButton: {
    backgroundColor: '#F44336',
    width: 45,
    height: 45,
    borderRadius: 22.5,
    justifyContent: 'center',
    alignItems: 'center',
  },
  deleteButtonText: {
    color: '#FFFFFF',
    fontSize: 18,
  },
  storageInfo: {
    backgroundColor: '#E8F4FD',
    borderRadius: 20,
    padding: 20,
    marginHorizontal: 20,
    marginBottom: 30,
  },
  storageTitle: {
    fontSize: 18,
    fontWeight: 'bold',
    color: '#0288D1',
    marginBottom: 12,
    textAlign: 'right',
  },
  storageText: {
    fontSize: 14,
    color: '#555',
    marginBottom: 8,
    textAlign: 'right',
    lineHeight: 22,
  },
});

export default RecordingScreen;
