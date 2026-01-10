import React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createStackNavigator } from '@react-navigation/stack';
import LanguageScreen from './screens/LanguageScreen';
import FormScreen from './screens/FormScreen';
import StoryLibraryScreen from './screens/StoryLibraryScreen';
import StoryReaderScreen from './screens/StoryReaderScreen';
import ChildFormScreen from './screens/ChildFormScreen';
import AuthCodeScreen from './screens/AuthCodeScreen';
import RecordingScreen from './screens/RecordingScreen';

const Stack = createStackNavigator();

export default function App() {
  return (
    <NavigationContainer>
      <Stack.Navigator 
        initialRouteName="Language"
        screenOptions={{
          headerStyle: {
            backgroundColor: '#4CAF50',
          },
          headerTintColor: '#fff',
          headerTitleStyle: {
            fontWeight: 'bold',
            fontSize: 20,
          },
          headerTitleAlign: 'center',
          headerBackTitleVisible: false,
          cardStyle: { backgroundColor: '#F8F9FA' },
        }}
      >
        <Stack.Screen 
          name="Language" 
          component={LanguageScreen} 
          options={{ headerShown: false }}
        />
        <Stack.Screen 
          name="Form" 
          component={FormScreen} 
          options={{ 
            title: '👶 بيانات الطفل',
            headerLeft: () => null,
            gestureEnabled: false
          }}
        />
        <Stack.Screen 
          name="StoryLibrary" 
          component={StoryLibraryScreen} 
          options={{ 
            title: '📚 مكتبة القصص',
            headerLeft: () => null
          }}
        />
        <Stack.Screen 
          name="StoryReader" 
          component={StoryReaderScreen} 
          options={({ route }) => ({ 
            title: route.params?.story?.title || '📖 القصة',
            headerRight: () => (
              route.params?.story?.id === '1' ? (
                <></>
              ) : null
            )
          })}
        />
        <Stack.Screen 
          name="ChildForm" 
          component={ChildFormScreen} 
          options={{ title: '💰 شراء القصة' }}
        />
        <Stack.Screen 
          name="AuthCode" 
          component={AuthCodeScreen} 
          options={{ title: '🔓 كود التفعيل' }}
        />
        <Stack.Screen 
          name="Recording" 
          component={RecordingScreen} 
          options={{ title: '🎤 تسجيل الصوت' }}
        />
      </Stack.Navigator>
    </NavigationContainer>
  );
}
