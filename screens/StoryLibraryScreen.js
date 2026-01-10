import React, { useState } from 'react';
import {
  View,
  Text,
  FlatList,
  TouchableOpacity,
  StyleSheet,
  Image,
  Alert,
} from 'react-native';

const StoryLibraryScreen = ({ navigation, route }) => {
  const { childData } = route.params || {};
  
  // القصص الكاملة مع الصور والمحتوى
  const [stories, setStories] = useState([
    {
      id: '1',
      title: 'عُلْبَةُ الأَلْوَانِ 🎨',
      category: 'قصص تعليمية',
      duration: '7 دقائق',
      ageGroup: '3-6 سنوات',
      color: '#FF6B6B',
      isFree: true,
      price: 0,
      unlocked: true,
      icon: '🎨',
      image: 'https://img.freepik.com/free-vector/kids-drawing-concept-illustration_114360-5201.jpg',
      description: 'قِصَّةٌ عَنِ التَّعَاوُنِ وَقِيمَةِ كُلِّ شَخْصٍ',
      content: [
        {
          text: 'كَانَ هُنَاكَ وَلَدٌ اسْمُهُ يُوسُفُ. كَانَ يُوسُفُ يُحِبُّ الرَّسْمَ وَالتَّلْوِينَ كَثِيرًا. لَمَّا رَأَى وَالِدُهُ قُدْرَتَهُ عَلَى الرَّسْمِ، أَحْضَرَ لَهُ عُلْبَةَ أَلْوَانٍ كَبِيرَةً هَدِيَّةً، فِيهَا كُلُّ الأَلْوَانِ الجَمِيلَةِ: أَحْمَرُ، أَخْضَرُ، أَصْفَرُ، وَغَيْرُهَا.',
          image: 'https://img.freepik.com/free-vector/kids-drawing-concept-illustration_114360-5201.jpg'
        },
        // ... باقي المحتوى
      ]
    },
    {
      id: '2',
      title: 'السُّوسَةُ وَفُرْشَاةُ الأَسْنَانِ 🦷',
      category: 'قصص صحية',
      duration: '5 دقائق',
      ageGroup: '3-6 سنوات',
      color: '#70D6FF',
      isFree: false,
      price: 10,
      unlocked: false,
      icon: '🦷',
      image: 'https://img.freepik.com/free-vector/cartoon-cavity-monster_1308-252.jpg',
      description: 'قِصَّةٌ عَنْ أَهَمِّيَّةِ تَنْظِيفِ الأَسْنَانِ'
    },
    {
      id: '3',
      title: 'حِكَايَةُ الخُضَارِ وَالفَاكِهَةِ 🍎',
      category: 'قصص غذائية',
      duration: '6 دقائق',
      ageGroup: '3-6 سنوات',
      color: '#4ECDC4',
      isFree: false,
      price: 10,
      unlocked: false,
      icon: '🍎',
      image: 'https://img.freepik.com/free-vector/family-eating-together_1308-249.jpg',
      description: 'قِصَّةٌ عَنْ فَوَائِدِ الخُضَارِ وَالفَاكِهَةِ'
    },
    {
      id: '4',
      title: 'مغامرة في الغابة 🌳',
      category: 'قصص مغامرات',
      duration: '8 دقائق',
      ageGroup: '6-9 سنوات',
      color: '#795548',
      isFree: false,
      price: 10,
      unlocked: false,
      icon: '🌳',
      image: 'https://img.freepik.com/free-vector/kids-playing-jungle_1308-196.jpg',
      description: 'مغامرة مثيرة في أعماق الغابة'
    },
    {
      id: '5',
      title: 'البطة الصغيرة 🦆',
      category: 'قصص الحيوانات',
      duration: '6 دقائق',
      ageGroup: '3-6 سنوات',
      color: '#FFC107',
      isFree: false,
      price: 10,
      unlocked: false,
      icon: '🦆',
      image: 'https://img.freepik.com/free-vector/cute-duck-swimming-pond_1308-200.jpg',
      description: 'قصة عن البطة الصغيرة والمغامرات'
    },
    {
      id: '6',
      title: 'الشمس والقمر 🌞',
      category: 'قصص كونية',
      duration: '5 دقائق',
      ageGroup: '6-9 سنوات',
      color: '#9C27B0',
      isFree: false,
      price: 10,
      unlocked: false,
      icon: '🌞',
      image: 'https://img.freepik.com/free-vector/sun-moon-stars_1308-189.jpg',
      description: 'قصة عن الصداقة بين الشمس والقمر'
    },
    {
      id: '7',
      title: 'القط ذو الحذاء 🐱',
      category: 'قصص كلاسيكية',
      duration: '7 دقائق',
      ageGroup: '6-9 سنوات',
      color: '#FF5722',
      isFree: false,
      price: 10,
      unlocked: false,
      icon: '🐱',
      image: 'https://img.freepik.com/free-vector/cute-cat-with-boots_1308-186.jpg',
      description: 'النسخة العربية من القصة الكلاسيكية'
    },
    {
      id: '8',
      title: 'البطل الصغير 🦸',
      category: 'قصص تشجيعية',
      duration: '6 دقائق',
      ageGroup: '6-9 سنوات',
      color: '#00BCD4',
      isFree: false,
      price: 10,
      unlocked: false,
      icon: '🦸',
      image: 'https://img.freepik.com/free-vector/kid-superhero_1308-183.jpg',
      description: 'قصة عن الشجاعة والإقدام'
    },
    {
      id: '9',
      title: 'قصتي المخصصة (فيديو) 🎬',
      category: 'قصص مخصصة',
      duration: '5 دقائق',
      ageGroup: '3-9 سنوات',
      color: '#E91E63',
      isFree: false,
      price: 200,
      unlocked: false,
      icon: '🎬',
      image: 'https://img.freepik.com/free-vector/video-production-concept_1308-181.jpg',
      description: 'قصة مخصصة برسوم متحركة'
    },
    {
      id: '10',
      title: 'صورتي الكرتونية 🤖',
      category: 'خدمات خاصة',
      duration: '-',
      ageGroup: 'جميع الأعمار',
      color: '#607D8B',
      isFree: false,
      price: 50,
      unlocked: false,
      icon: '🤖',
      image: 'https://img.freepik.com/free-vector/cartoon-character-design_1308-178.jpg',
      description: 'تحويل الصورة لرسم كرتوني'
    }
  ]);

  const handleStoryPress = (story) => {
    if (story.unlocked) {
      navigation.navigate('StoryReader', { 
        story,
        childData 
      });
    } else {
      navigation.navigate('ChildForm', { 
        story,
        childData
      });
    }
  };

  const handleAddChild = () => {
    Alert.alert(
      'تعديل البيانات',
      'يمكنك تعديل بيانات الطفل في أي وقت',
      [{ text: 'حسناً' }]
    );
  };

  const renderStoryItem = ({ item }) => (
    <TouchableOpacity
      style={[styles.storyCard, { borderLeftColor: item.color }]}
      onPress={() => handleStoryPress(item)}
    >
      <View style={styles.storyContent}>
        {item.image && (
          <Image source={{ uri: item.image }} style={styles.storyImage} />
        )}
        
        <View style={styles.storyInfo}>
          <View style={styles.storyHeader}>
            <Text style={styles.storyTitle}>{item.title}</Text>
            <View style={styles.statusBadge}>
              {item.unlocked ? (
                <Text style={styles.statusTextFree}>🔓 مجاني</Text>
              ) : (
                <Text style={styles.statusTextPaid}>🔒 {item.price} ج.م</Text>
              )}
            </View>
          </View>
          
          <Text style={styles.storyCategory}>{item.category}</Text>
          <Text style={styles.storyDescription}>{item.description}</Text>
          
          <View style={styles.storyDetails}>
            <Text style={styles.detailItem}>⏱️ {item.duration}</Text>
            <Text style={styles.detailItem}>👶 {item.ageGroup}</Text>
          </View>
          
          <TouchableOpacity 
            style={styles.actionButton}
            onPress={() => handleStoryPress(item)}
          >
            <Text style={styles.actionButtonText}>
              {item.unlocked ? '📖 اقرأ مجاناً' : '💰 اشتر الآن'}
            </Text>
          </TouchableOpacity>
        </View>
      </View>
    </TouchableOpacity>
  );

  return (
    <View style={styles.container}>
      {/* العنوان الرئيسي فقط مرة واحدة */}
      <View style={styles.header}>
        <Text style={styles.mainTitle}>📚 مكتبة القصص</Text>
        
        {childData && (
          <View style={styles.profileContainer}>
            {childData.photo ? (
              <Image source={{ uri: childData.photo }} style={styles.profileImage} />
            ) : (
              <View style={styles.profileIcon}>
                <Text style={styles.profileIconText}>
                  {childData.gender === 'ولد' ? '👦' : '👧'}
                </Text>
              </View>
            )}
            <View style={styles.profileInfo}>
              <Text style={styles.profileName}>{childData.name}</Text>
              <Text style={styles.profileDetails}>
                {childData.age} سنة - {childData.gender}
              </Text>
            </View>
          </View>
        )}
      </View>

      {/* إحصائيات المكتبة */}
      <View style={styles.statsBox}>
        <View style={styles.statItem}>
          <Text style={styles.statNumber}>{stories.length}</Text>
          <Text style={styles.statLabel}>قصص متاحة</Text>
        </View>
        <View style={styles.statItem}>
          <Text style={styles.statNumber}>1</Text>
          <Text style={styles.statLabel}>مجانية</Text>
        </View>
        <View style={styles.statItem}>
          <Text style={styles.statNumber}>9</Text>
          <Text style={styles.statLabel}>مدفوعة</Text>
        </View>
      </View>

      {/* قائمة القصص */}
      <FlatList
        data={stories}
        renderItem={renderStoryItem}
        keyExtractor={item => item.id}
        showsVerticalScrollIndicator={false}
        contentContainerStyle={styles.storiesList}
        ListHeaderComponent={
          <Text style={styles.sectionTitle}>اختر قصة مناسبة لطفلك</Text>
        }
      />
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#F5F7FA',
  },
  header: {
    backgroundColor: '#4CAF50',
    paddingTop: 25,
    paddingBottom: 20,
    borderBottomLeftRadius: 30,
    borderBottomRightRadius: 30,
    elevation: 8,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.15,
    shadowRadius: 10,
  },
  mainTitle: {
    fontSize: 30,
    fontWeight: 'bold',
    color: '#FFFFFF',
    textAlign: 'center',
    marginBottom: 15,
  },
  profileContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: 'rgba(255, 255, 255, 0.2)',
    marginHorizontal: 20,
    padding: 12,
    borderRadius: 20,
  },
  profileImage: {
    width: 55,
    height: 55,
    borderRadius: 27.5,
    borderWidth: 2,
    borderColor: '#FFFFFF',
    marginRight: 12,
  },
  profileIcon: {
    width: 55,
    height: 55,
    borderRadius: 27.5,
    backgroundColor: '#FFFFFF',
    justifyContent: 'center',
    alignItems: 'center',
    marginRight: 12,
  },
  profileIconText: {
    fontSize: 26,
  },
  profileInfo: {
    flex: 1,
  },
  profileName: {
    fontSize: 18,
    fontWeight: 'bold',
    color: '#FFFFFF',
    textAlign: 'right',
    marginBottom: 3,
  },
  profileDetails: {
    fontSize: 14,
    color: 'rgba(255, 255, 255, 0.9)',
    textAlign: 'right',
  },
  statsBox: {
    flexDirection: 'row',
    backgroundColor: '#FFFFFF',
    marginHorizontal: 20,
    marginTop: 20,
    borderRadius: 18,
    paddingVertical: 15,
    elevation: 5,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 3 },
    shadowOpacity: 0.1,
    shadowRadius: 6,
  },
  statItem: {
    flex: 1,
    alignItems: 'center',
  },
  statNumber: {
    fontSize: 26,
    fontWeight: 'bold',
    color: '#4CAF50',
    marginBottom: 5,
  },
  statLabel: {
    fontSize: 13,
    color: '#666666',
  },
  storiesList: {
    paddingHorizontal: 20,
    paddingTop: 20,
    paddingBottom: 30,
  },
  sectionTitle: {
    fontSize: 22,
    fontWeight: 'bold',
    color: '#2C3E50',
    marginBottom: 20,
    textAlign: 'right',
  },
  storyCard: {
    backgroundColor: '#FFFFFF',
    borderRadius: 20,
    marginBottom: 18,
    overflow: 'hidden',
    elevation: 4,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 3 },
    shadowOpacity: 0.1,
    shadowRadius: 8,
  },
  storyContent: {
    flexDirection: 'row',
  },
  storyImage: {
    width: 100,
    height: 120,
  },
  storyInfo: {
    flex: 1,
    padding: 15,
  },
  storyHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'flex-start',
    marginBottom: 8,
  },
  storyTitle: {
    fontSize: 18,
    fontWeight: 'bold',
    color: '#2C3E50',
    flex: 1,
    marginRight: 10,
  },
  statusBadge: {
    paddingHorizontal: 10,
    paddingVertical: 4,
    borderRadius: 12,
  },
  statusTextFree: {
    color: '#4CAF50',
    fontSize: 12,
    fontWeight: 'bold',
  },
  statusTextPaid: {
    color: '#FF9800',
    fontSize: 12,
    fontWeight: 'bold',
  },
  storyCategory: {
    fontSize: 12,
    color: '#666666',
    marginBottom: 8,
    textAlign: 'right',
  },
  storyDescription: {
    fontSize: 14,
    color: '#555555',
    lineHeight: 20,
    marginBottom: 12,
    textAlign: 'right',
  },
  storyDetails: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    marginBottom: 12,
  },
  detailItem: {
    fontSize: 13,
    color: '#777777',
    backgroundColor: '#F5F5F5',
    paddingHorizontal: 10,
    paddingVertical: 5,
    borderRadius: 8,
  },
  actionButton: {
    backgroundColor: '#4CAF50',
    paddingVertical: 10,
    paddingHorizontal: 20,
    borderRadius: 10,
    alignSelf: 'flex-end',
  },
  actionButtonText: {
    color: '#FFFFFF',
    fontSize: 14,
    fontWeight: 'bold',
  },
});

export default StoryLibraryScreen;
