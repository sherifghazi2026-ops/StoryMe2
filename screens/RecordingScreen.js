import React from 'react';
import { View, Text, StyleSheet, TouchableOpacity } from 'react-native';

export default function RecordingScreen({ navigation, route }) {
  const { story } = route.params || {};

  return (
    <View style={styles.container}>
      <Text style={styles.title}>🎤 شاشة التسجيل</Text>
      <Text style={styles.subtitle}>(هذه الشاشة قيد التطوير)</Text>
      
      {story && (
        <View style={styles.infoBox}>
          <Text style={styles.infoText}>القصة: {story.title}</Text>
        </View>
      )}
      
      <View style={styles.recordingBox}>
        <Text style={styles.recordingText}>⏺️ التسجيل الصوتي</Text>
        <View style={styles.recordingIndicator} />
      </View>
      
      <TouchableOpacity
        style={styles.backButton}
        onPress={() => navigation.goBack()}
      >
        <Text style={styles.backButtonText}>العودة للقصة</Text>
      </TouchableOpacity>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#E8F4FD',
    justifyContent: 'center',
    alignItems: 'center',
    padding: 20,
  },
  title: {
    fontSize: 28,
    fontWeight: 'bold',
    color: '#2C3E50',
    marginBottom: 10,
  },
  subtitle: {
    fontSize: 16,
    color: '#5D6D7E',
    marginBottom: 30,
  },
  infoBox: {
    backgroundColor: '#fff',
    padding: 20,
    borderRadius: 15,
    marginBottom: 30,
    width: '100%',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
    elevation: 3,
  },
  infoText: {
    fontSize: 18,
    color: '#4A90E2',
    textAlign: 'center',
    fontWeight: '600',
  },
  recordingBox: {
    backgroundColor: '#fff',
    padding: 40,
    borderRadius: 20,
    marginBottom: 30,
    width: 200,
    height: 200,
    justifyContent: 'center',
    alignItems: 'center',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.2,
    shadowRadius: 8,
    elevation: 5,
  },
  recordingText: {
    fontSize: 18,
    color: '#333',
    marginBottom: 20,
  },
  recordingIndicator: {
    width: 80,
    height: 80,
    borderRadius: 40,
    backgroundColor: '#FF6B6B',
  },
  backButton: {
    backgroundColor: '#4A90E2',
    padding: 15,
    borderRadius: 12,
    width: '80%',
    alignItems: 'center',
  },
  backButtonText: {
    color: '#fff',
    fontSize: 16,
    fontWeight: 'bold',
  },
});
