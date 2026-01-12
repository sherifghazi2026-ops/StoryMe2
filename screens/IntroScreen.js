import React, { useEffect } from 'react';
import { View, Image, StyleSheet } from 'react-native';

export default function IntroScreen({ navigation }) {
  useEffect(() => {
    // بعد 3 ثواني يروح للصفحة الرئيسية (مثال: StoryLibraryScreen)
    const timer = setTimeout(() => {
      navigation.replace('StoryLibrary'); 
    }, 3000);

    return () => clearTimeout(timer);
  }, []);

  return (
    <View style={styles.container}>
      <Image 
        source={require('../assets/intro.gif')} 
        style={styles.image} 
        resizeMode="contain"
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    justifyContent: 'center',
    alignItems: 'center',
  },
  image: {
    width: '80%',
    height: '80%',
  },
});
