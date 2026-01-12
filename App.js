import React, { useState, useEffect } from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createStackNavigator } from '@react-navigation/stack';
import AsyncStorage from '@react-native-async-storage/async-storage';

import LanguageScreen from './screens/LanguageScreen';
import FormScreen from './screens/FormScreen';
import StoryLibraryScreen from './screens/StoryLibraryScreen';
import StoryReaderScreen from './screens/StoryReaderScreen';
import CustomStoryScreen from './screens/CustomStoryScreen';
import StoryEndScreen from './screens/StoryEndScreen';
import PackStoriesScreen from './screens/PackStoriesScreen';
import AuthCodeScreen from './screens/AuthCodeScreen';
// إضافة الشاشات المفقودة
import RecordingScreen from './screens/RecordingScreen';
import ChildFormScreen from './screens/ChildFormScreen';

const Stack = createStackNavigator();

export default function App() {
  const [childInfo, setChildInfo] = useState(null);
  const [initialRoute, setInitialRoute] = useState('Language');

  useEffect(() => {
    checkChildInfo();
  }, []);

  const checkChildInfo = async () => {
    try {
      const savedChildInfo = await AsyncStorage.getItem('childInfo');
      if (savedChildInfo) {
        setChildInfo(JSON.parse(savedChildInfo));
        setInitialRoute('StoryLibrary');
      }
    } catch (error) {
      console.error('Error loading child info:', error);
    }
  };

  const updateChildInfo = async (info) => {
    try {
      setChildInfo(info);
      await AsyncStorage.setItem('childInfo', JSON.stringify(info));
    } catch (error) {
      console.error('Error saving child info:', error);
    }
  };

  const clearChildInfo = async () => {
    try {
      setChildInfo(null);
      await AsyncStorage.removeItem('childInfo');
    } catch (error) {
      console.error('Error clearing child info:', error);
    }
  };

  return (
    <NavigationContainer>
      <Stack.Navigator 
        initialRouteName={initialRoute}
        screenOptions={{
          headerShown: false,
          cardStyle: { backgroundColor: '#E8F4FD' }
        }}
      >
        <Stack.Screen name="Language">
          {props => <LanguageScreen {...props} />}
        </Stack.Screen>
        
        <Stack.Screen name="Form">
          {props => (
            <FormScreen 
              {...props} 
              updateChildInfo={updateChildInfo}
            />
          )}
        </Stack.Screen>
        
        <Stack.Screen name="StoryLibrary">
          {props => (
            <StoryLibraryScreen 
              {...props} 
              childInfo={childInfo}
              clearChildInfo={clearChildInfo}
            />
          )}
        </Stack.Screen>
        
        <Stack.Screen name="PackStories">
          {props => (
            <PackStoriesScreen 
              {...props} 
              childInfo={childInfo}
            />
          )}
        </Stack.Screen>
        
        <Stack.Screen name="StoryReader">
          {props => (
            <StoryReaderScreen 
              {...props} 
              childInfo={childInfo}
            />
          )}
        </Stack.Screen>
        
        <Stack.Screen name="CustomStory">
          {props => (
            <CustomStoryScreen 
              {...props} 
              childInfo={childInfo}
            />
          )}
        </Stack.Screen>
        
        <Stack.Screen name="StoryEnd">
          {props => (
            <StoryEndScreen 
              {...props} 
              childInfo={childInfo}
            />
          )}
        </Stack.Screen>
        
        <Stack.Screen name="AuthCode">
          {props => <AuthCodeScreen {...props} />}
        </Stack.Screen>
        
        {/* إضافة الشاشات المفقودة */}
        <Stack.Screen name="Recording">
          {props => (
            <RecordingScreen 
              {...props} 
              childInfo={childInfo}
            />
          )}
        </Stack.Screen>
        
        <Stack.Screen name="ChildForm">
          {props => (
            <ChildFormScreen 
              {...props} 
              childInfo={childInfo}
            />
          )}
        </Stack.Screen>
      </Stack.Navigator>
    </NavigationContainer>
  );
}
