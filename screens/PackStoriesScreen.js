import React, { useState } from 'react';
import {
  View,
  Text,
  TouchableOpacity,
  StyleSheet,
  ScrollView,
  Image
} from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

export default function PackStoriesScreen({ navigation, route, childInfo }) {
  const { pack } = route.params || {};
  const [stories] = useState(pack?.stories || []);

  const handleStoryPress = (story) => {
    navigation.navigate('StoryReader', {
      story,
      packId: pack?.id,
      packTitle: pack?.title
    });
  };

  if (!pack) {
    return (
      <SafeAreaView style={styles.container}>
        <View style={styles.errorContainer}>
          <Text style={styles.errorText}>لم يتم العثور على الباقة</Text>
          <TouchableOpacity
            style={styles.backButton}
            onPress={() => navigation.goBack()}
          >
            <Text style={styles.backButtonText}>العودة</Text>
          </TouchableOpacity>
        </View>
      </SafeAreaView>
    );
  }

  return (
    <SafeAreaView style={styles.container}>
      <View style={styles.header}>
        <Text style={styles.appTitle}>{pack.title}</Text>
        
        <TouchableOpacity
          style={styles.smallBackButton}
          onPress={() => navigation.goBack()}
        >
          <Text style={styles.smallBackButtonText}>↩️ العودة</Text>
        </TouchableOpacity>
      </View>
      
      <View style={styles.packInfo}>
        <Text style={styles.packDescription}>{pack.description}</Text>
        <View style={styles.packStats}>
          <Text style={styles.packStat}>
            {pack.isFree ? '🆓 مجاني' : `💰 ${pack.price} ج.م`}
          </Text>
          <Text style={styles.packStat}>📖 {stories.length} قصة</Text>
        </View>
      </View>
      
      <ScrollView contentContainerStyle={styles.storiesContainer}>
        <Text style={styles.sectionTitle}>قصص الباقة:</Text>
        
        {stories.map((story, index) => (
          <TouchableOpacity
            key={story.id}
            style={[styles.storyCard, { borderLeftColor: story.color || pack.color }]}
            onPress={() => handleStoryPress(story)}
          >
            <View style={styles.storyHeader}>
              <Text style={styles.storyTitle}>{story.title}</Text>
              <Text style={[styles.partsCount, { backgroundColor: story.color || pack.color }]}>
                {story.storyParts?.length || 0} جزء
              </Text>
            </View>
            
            <Text style={styles.storyDescription}>{story.description}</Text>
            
            <View style={styles.lessonsContainer}>
              <Text style={styles.lessonsTitle}>الدروس المستفادة:</Text>
              {story.lessons?.slice(0, 2).map((lesson, i) => (
                <Text key={i} style={styles.lessonItem}>• {lesson}</Text>
              ))}
              {story.lessons?.length > 2 && (
                <Text style={styles.moreLessons}>+ {story.lessons.length - 2} دروس أخرى</Text>
              )}
            </View>
            
            <View style={styles.readButtonContainer}>
              <TouchableOpacity
                style={[styles.readButton, { backgroundColor: story.color || pack.color }]}
                onPress={() => handleStoryPress(story)}
              >
                <Text style={styles.readButtonText}>قراءة القصة 📖</Text>
              </TouchableOpacity>
            </View>
          </TouchableOpacity>
        ))}
      </ScrollView>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#E8F4FD',
  },
  errorContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    padding: 20,
  },
  errorText: {
    fontSize: 20,
    color: '#FF6B6B',
    marginBottom: 20,
  },
  header: {
    padding: 20,
    backgroundColor: '#4A90E2',
    borderBottomLeftRadius: 25,
    borderBottomRightRadius: 25,
    alignItems: 'center',
    marginBottom: 10,
    position: 'relative',
  },
  appTitle: {
    fontSize: 26,
    fontWeight: 'bold',
    color: '#FFFFFF',
    textAlign: 'center',
    marginBottom: 15,
  },
  smallBackButton: {
    position: 'absolute',
    top: 15,
    left: 15,
    backgroundColor: 'rgba(255, 255, 255, 0.3)',
    padding: 8,
    borderRadius: 10,
  },
  smallBackButtonText: {
    color: '#FFFFFF',
    fontSize: 14,
    fontWeight: '600',
  },
  packInfo: {
    backgroundColor: '#FFFFFF',
    marginHorizontal: 20,
    marginTop: 10,
    padding: 15,
    borderRadius: 15,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
    elevation: 3,
  },
  packDescription: {
    fontSize: 16,
    color: '#5D6D7E',
    textAlign: 'right',
    marginBottom: 10,
    lineHeight: 24,
  },
  packStats: {
    flexDirection: 'row',
    justifyContent: 'space-around',
    marginTop: 10,
  },
  packStat: {
    fontSize: 14,
    fontWeight: 'bold',
    color: '#4A90E2',
    backgroundColor: '#E8F4FD',
    paddingHorizontal: 15,
    paddingVertical: 8,
    borderRadius: 20,
  },
  storiesContainer: {
    padding: 15,
    paddingBottom: 30,
  },
  sectionTitle: {
    fontSize: 22,
    fontWeight: 'bold',
    color: '#2C3E50',
    marginBottom: 15,
    textAlign: 'right',
  },
  storyCard: {
    backgroundColor: '#FFFFFF',
    borderRadius: 15,
    padding: 20,
    marginBottom: 15,
    borderLeftWidth: 6,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
    elevation: 3,
  },
  storyHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: 10,
  },
  storyTitle: {
    fontSize: 20,
    fontWeight: 'bold',
    color: '#2C3E50',
    flex: 1,
  },
  partsCount: {
    color: '#FFFFFF',
    paddingHorizontal: 12,
    paddingVertical: 6,
    borderRadius: 12,
    fontSize: 13,
    fontWeight: 'bold',
  },
  storyDescription: {
    fontSize: 16,
    color: '#5D6D7E',
    lineHeight: 22,
    marginBottom: 10,
    textAlign: 'right',
  },
  lessonsContainer: {
    marginTop: 10,
    padding: 10,
    backgroundColor: '#F8F9F9',
    borderRadius: 10,
  },
  lessonsTitle: {
    fontSize: 14,
    fontWeight: 'bold',
    color: '#2C3E50',
    marginBottom: 5,
    textAlign: 'right',
  },
  lessonItem: {
    fontSize: 13,
    color: '#5D6D7E',
    marginBottom: 3,
    textAlign: 'right',
  },
  moreLessons: {
    fontSize: 12,
    color: '#4A90E2',
    textAlign: 'right',
    fontStyle: 'italic',
    marginTop: 5,
  },
  readButtonContainer: {
    marginTop: 15,
    alignItems: 'center',
  },
  readButton: {
    padding: 12,
    borderRadius: 10,
    width: '80%',
    alignItems: 'center',
  },
  readButtonText: {
    color: '#FFFFFF',
    fontSize: 16,
    fontWeight: 'bold',
  },
  backButton: {
    backgroundColor: '#4A90E2',
    padding: 12,
    borderRadius: 8,
    alignItems: 'center',
  },
  backButtonText: {
    color: '#FFFFFF',
    fontSize: 16,
    fontWeight: 'bold',
  },
});
