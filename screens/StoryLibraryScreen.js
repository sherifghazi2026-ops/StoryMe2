import React, { useState, useEffect } from 'react';
import {
  View,
  Text,
  TouchableOpacity,
  StyleSheet,
  ScrollView,
  Image,
  Alert
} from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

// استيراد الباقات
import pack1 from '../packages/pack1';

// سننشئ باقات تجريبية مؤقتة
const pack2 = {
  id: 'pack2',
  title: 'الباقة الثانية',
  description: 'قصص المغامرات والتعلم',
  price: 20,
  isFree: false,
  color: '#FF9800',
  stories: []
};

const pack3 = {
  id: 'pack3',
  title: 'الباقة الثالثة',
  description: 'قصص القيم والأخلاق',
  price: 30,
  isFree: false,
  color: '#9C27B0',
  stories: []
};

const pack4 = {
  id: 'pack4',
  title: 'الباقة الرابعة',
  description: 'قصص العلوم والمعرفة',
  price: 40,
  isFree: false,
  color: '#00BCD4',
  stories: []
};

const pack5 = {
  id: 'pack5',
  title: 'الباقة الخامسة',
  description: 'قصص الخيال والابداع',
  price: 50,
  isFree: false,
  color: '#8BC34A',
  stories: []
};

export default function StoryLibraryScreen({ navigation, childInfo, clearChildInfo }) {
  const [packs, setPacks] = useState([]);

  useEffect(() => {
    // تحميل الباقات مع التحقق من وجود القصص
    const loadedPacks = [pack1, pack2, pack3, pack4, pack5].filter(pack => {
      return pack && typeof pack === 'object';
    }).map(pack => ({
      ...pack,
      stories: Array.isArray(pack.stories) ? pack.stories : []
    }));
    setPacks(loadedPacks);
  }, []);

  const handlePackPress = (pack) => {
    if (!pack || !pack.stories) {
      Alert.alert('خطأ', 'هذه الباقة غير متاحة حالياً');
      return;
    }
    
    if (!pack.isFree) {
      navigation.navigate('AuthCode', { pack });
    } else {
      navigation.navigate('PackStories', { pack });
    }
  };

  const handleCustomStory = () => {
    if (!childInfo) {
      Alert.alert('معلومات ناقصة', 'يرجى تعبئة معلومات الطفل أولاً');
      navigation.navigate('Form');
      return;
    }
    navigation.navigate('CustomStory');
  };

  const handleLogout = () => {
    Alert.alert(
      'تسجيل الخروج',
      'هل تريد تسجيل الخروج؟',
      [
        { text: 'إلغاء', style: 'cancel' },
        {
          text: 'نعم',
          onPress: () => {
            clearChildInfo();
            navigation.navigate('Language');
          }
        }
      ]
    );
  };

  // حساب عدد القصص مع التحقق
  const getStoriesCount = (pack) => {
    return Array.isArray(pack?.stories) ? pack.stories.length : 0;
  };

  return (
    <SafeAreaView style={styles.container}>
      <View style={styles.header}>
        <Text style={styles.appTitle}>📖 مكتبة القصص</Text>
        
        {childInfo && (
          <View style={styles.profileContainer}>
            {childInfo.photo ? (
              <Image source={{ uri: childInfo.photo }} style={styles.headerProfilePhoto} />
            ) : (
              <View style={styles.defaultProfileIcon}>
                <Text style={styles.defaultIconText}>
                  {childInfo.gender === 'ولد' ? '👦' : '👧'}
                </Text>
              </View>
            )}
            <View style={styles.profileTextContainer}>
              <Text style={styles.profileName}>{childInfo.name}</Text>
              <Text style={styles.profileDetails}>
                {childInfo.age} سنة - {childInfo.gender === 'ولد' ? 'ولد' : 'بنت'}
              </Text>
            </View>
            
            <TouchableOpacity style={styles.logoutButton} onPress={handleLogout}>
              <Text style={styles.logoutText}>🚪</Text>
            </TouchableOpacity>
          </View>
        )}
      </View>
      
      <ScrollView contentContainerStyle={styles.storiesContainer}>
        <Text style={styles.sectionTitle}>الباقات المتاحة</Text>
        
        {packs.map((pack) => {
          const storiesCount = getStoriesCount(pack);
          
          return (
            <TouchableOpacity
              key={pack.id}
              style={[styles.packCard, { borderLeftColor: pack.color || '#4A90E2' }]}
              onPress={() => handlePackPress(pack)}
            >
              <View style={styles.packHeader}>
                <Text style={styles.packTitle}>{pack.title || 'باقة بدون عنوان'}</Text>
                <View style={styles.packBadgeContainer}>
                  {pack.isFree ? (
                    <Text style={[styles.packBadge, { backgroundColor: '#4CAF50' }]}>
                      مجاني
                    </Text>
                  ) : (
                    <Text style={[styles.packBadge, { backgroundColor: '#FF9800' }]}>
                      {pack.price || 0} ج.م
                    </Text>
                  )}
                  <Text style={[styles.packStoriesCount, { backgroundColor: pack.color || '#4A90E2' }]}>
                    {storiesCount} قصة
                  </Text>
                </View>
              </View>
              <Text style={styles.packDescription}>{pack.description || 'لا يوجد وصف'}</Text>
              
              {storiesCount > 0 && (
                <View style={styles.storiesPreview}>
                  {pack.stories.slice(0, 2).map((story, index) => (
                    <View key={index} style={styles.storyPreviewItem}>
                      <Text style={styles.previewStoryTitle}>• {story.title || 'قصة بدون عنوان'}</Text>
                    </View>
                  ))}
                  {storiesCount > 2 && (
                    <Text style={styles.moreStoriesText}>+ {storiesCount - 2} قصص أخرى</Text>
                  )}
                </View>
              )}
            </TouchableOpacity>
          );
        })}
        
        {/* قصة الطفل المخصصة */}
        <TouchableOpacity
          style={[styles.packCard, { borderLeftColor: '#FFD166' }]}
          onPress={handleCustomStory}
        >
          <View style={styles.packHeader}>
            <Text style={styles.packTitle}>قصة خاصة بك ✨</Text>
            <Text style={[styles.packBadge, { backgroundColor: '#FFD166', color: '#000' }]}>
              50 ج.م
            </Text>
          </View>
          <Text style={styles.packDescription}>
            قصة مخصصة لـ {childInfo?.name || 'طفلك'} باستخدام الذكاء الاصطناعي
          </Text>
          <View style={styles.featuresList}>
            <Text style={styles.featureItem}>✓ شخصية الطفل هي بطل القصة</Text>
            <Text style={styles.featureItem}>✓ فيديو متحرك برسوم كرتونية</Text>
            <Text style={styles.featureItem}>✓ إرسال على الواتساب</Text>
            <Text style={styles.featureItem}>✓ التوصيل خلال ٣ أيام</Text>
          </View>
        </TouchableOpacity>
      </ScrollView>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#E8F4FD',
  },
  header: {
    padding: 20,
    backgroundColor: '#4A90E2',
    borderBottomLeftRadius: 25,
    borderBottomRightRadius: 25,
    alignItems: 'center',
    marginBottom: 10,
  },
  appTitle: {
    fontSize: 26,
    fontWeight: 'bold',
    color: '#FFFFFF',
    textAlign: 'center',
    marginBottom: 15,
  },
  profileContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: 'rgba(255, 255, 255, 0.2)',
    padding: 15,
    borderRadius: 25,
    marginBottom: 15,
    width: '100%',
  },
  headerProfilePhoto: {
    width: 70,
    height: 70,
    borderRadius: 35,
    borderWidth: 3,
    borderColor: '#FFFFFF',
    marginRight: 15,
  },
  defaultProfileIcon: {
    width: 70,
    height: 70,
    borderRadius: 35,
    backgroundColor: '#FFFFFF',
    justifyContent: 'center',
    alignItems: 'center',
    marginRight: 15,
  },
  defaultIconText: {
    fontSize: 32,
  },
  profileTextContainer: {
    flex: 1,
  },
  profileName: {
    fontSize: 20,
    fontWeight: 'bold',
    color: '#FFFFFF',
    textAlign: 'right',
  },
  profileDetails: {
    fontSize: 16,
    color: '#E8F4FD',
    textAlign: 'right',
    marginTop: 5,
  },
  logoutButton: {
    padding: 10,
    backgroundColor: 'rgba(255, 255, 255, 0.3)',
    borderRadius: 20,
  },
  logoutText: {
    fontSize: 20,
    color: '#FFFFFF',
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
  packCard: {
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
  packHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: 10,
  },
  packTitle: {
    fontSize: 20,
    fontWeight: 'bold',
    color: '#2C3E50',
    flex: 1,
  },
  packBadgeContainer: {
    flexDirection: 'row',
    gap: 10,
  },
  packBadge: {
    color: '#FFFFFF',
    paddingHorizontal: 12,
    paddingVertical: 6,
    borderRadius: 12,
    fontSize: 13,
    fontWeight: 'bold',
  },
  packStoriesCount: {
    color: '#FFFFFF',
    paddingHorizontal: 12,
    paddingVertical: 6,
    borderRadius: 12,
    fontSize: 13,
    fontWeight: 'bold',
  },
  packDescription: {
    fontSize: 16,
    color: '#5D6D7E',
    lineHeight: 22,
    marginBottom: 10,
  },
  storiesPreview: {
    marginTop: 10,
    padding: 10,
    backgroundColor: '#F8F9F9',
    borderRadius: 10,
  },
  storyPreviewItem: {
    marginBottom: 5,
  },
  previewStoryTitle: {
    fontSize: 14,
    color: '#5D6D7E',
    textAlign: 'right',
  },
  moreStoriesText: {
    fontSize: 12,
    color: '#4A90E2',
    textAlign: 'right',
    fontStyle: 'italic',
    marginTop: 5,
  },
  featuresList: {
    marginTop: 10,
  },
  featureItem: {
    fontSize: 14,
    color: '#4A90E2',
    marginBottom: 5,
    textAlign: 'right',
  },
});
