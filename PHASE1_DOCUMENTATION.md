# Phase 1 - App Concept and Basic UI Documentation

## Tasky: Productivity & Task Management App

---

## 1. App Idea Description

### Main Purpose
Tasky is a productivity application designed to help users manage their tasks and maintain focus through integrated time management tools. The app combines task tracking with focus timer functionality to create a comprehensive productivity solution.

### Target Users
- Students managing coursework and study sessions
- Professionals tracking work tasks and projects
- Anyone seeking to improve productivity through structured task management and focused work sessions
- Users who practice techniques like the Pomodoro method

### Key Use Cases
1. **Task Management**: Users can create, organize, and track tasks with priorities, descriptions, and due dates
2. **Focus Sessions**: Users can start timed focus sessions to maintain concentration on specific tasks
3. **Quick Dashboard**: Users get an overview of their productivity stats and quick access to main features
4. **Custom Timers**: Users can create and save custom focus session durations for different work patterns

---

## 2. Development Plan and Milestones

### Phase 1 (Week 7) - App Concept and Basic UI ✅ COMPLETED
**Milestone**: Establish app foundation with navigation and core screens

**Completed Features:**
- Bottom navigation with three main tabs (Home, Tasks, Timer)
- Home screen with dashboard, stats placeholders, and quick action buttons
- Tasks screen with full CRUD functionality (Create, Read, Update, Delete)
- Timer screen with countdown functionality and session management
- Responsive design across different screen sizes
- Consistent color scheme (deep purple theme) and typography

**Modules/Screens Implemented:**
- `main.dart`: App entry point with bottom navigation structure
- `home_screen.dart`: Welcome dashboard with quick actions
- `tasks_screen_clean.dart`: Full task management interface
- `timer_screen.dart`: Focus timer with customizable sessions

---

### Phase 2 (Week 9) - Core Functionality and State Management
**Milestone**: Implement persistent data storage and enhanced state management

**Planned Features:**
- Local data persistence using shared_preferences or SQLite
- Task persistence across app sessions
- Timer session history tracking
- Enhanced state management (Provider or Riverpod)
- Task filtering and sorting capabilities
- Statistics calculation (completed tasks, total focus time)

**Technical Goals:**
- Implement database schema for tasks and sessions
- Set up state management architecture
- Add data validation and error handling

---

### Phase 3 (Week 11) - Advanced Features and Polish
**Milestone**: Add advanced functionality and improve user experience

**Planned Features:**
- Task categories and tags
- Notifications for task deadlines
- Timer notifications and sound alerts
- Dark mode support
- Task search functionality
- Export/import tasks
- Weekly/monthly productivity reports

**Technical Goals:**
- Implement local notifications
- Add theme switching capability
- Optimize performance
- Enhance UI animations and transitions

---

### Phase 4 (Week 13) - Testing and Deployment
**Milestone**: Finalize app and prepare for release

**Planned Activities:**
- Comprehensive testing (unit, widget, integration tests)
- Bug fixes and performance optimization
- User feedback implementation
- App icon and splash screen design
- Prepare for app store deployment
- Final documentation and code cleanup

**Deliverables:**
- Fully tested production-ready app
- Complete user documentation
- Deployment to test environment
- Final presentation materials

---

## 3. Current Technical Implementation

### Architecture
- **Framework**: Flutter (Dart)
- **State Management**: setState (basic, will upgrade in Phase 2)
- **Navigation**: Bottom Navigation Bar with three tabs
- **UI Paradigm**: Material Design

### Screen Breakdown

#### Home Screen
- Welcome message and motivational quote
- Stat cards (Tasks Today, Focus Time, Streak) - placeholder values
- Quick action buttons for Add Task, Start Timer, and View Tasks
- Responsive layout using MediaQuery for font scaling

#### Tasks Screen
- Task list with numbered tasks and priority indicators
- Add task modal with:
  - Title and description fields
  - Important/urgent checkbox
  - Due date and time picker
- Task item features:
  - Strike-through for completed tasks
  - Star icon for important tasks
  - Check icon to mark as finished
  - Color-coded avatars (red for important, purple for normal)
- Empty state message when no tasks exist

#### Timer Screen
- Large circular timer display with gradient background
- Control buttons: Start, Pause, Reset
- Saved sessions list with:
  - Session name and duration
  - Play button to start session
  - Delete button to remove session
- Create session modal with hour/minute/second inputs
- Default 25-minute focus session included

### Design System
- **Primary Color**: Deep Purple (#673AB7)
- **Accent Colors**: Purple shades, red for important items, green for completed
- **Typography**: 
  - Headers: 18-36px, bold
  - Body text: 12-16px, regular/semi-bold
  - Responsive scaling based on screen width
- **Spacing**: Consistent 8-16px padding and margins throughout
- **Components**: Cards, elevated buttons, text buttons, icon buttons, floating action button

---

## 4. Feature Evolution Across Phases

### Current State (Phase 1)
Basic functionality with in-memory storage. Tasks and sessions are lost when app closes.

### Phase 2 Enhancement
Tasks and sessions persist using local database. State management improved for better performance.

### Phase 3 Enhancement
Advanced features like categories, notifications, and detailed analytics added.

### Phase 4 Polish
Final testing, performance optimization, and deployment preparation.

---

## 5. Success Criteria

### Phase 1 ✅
- [x] Three functional screens implemented
- [x] Bottom navigation working
- [x] Responsive across device sizes
- [x] Clean, consistent UI design
- [x] Pure Flutter/Dart implementation
- [x] No comments in production code
- [x] GitHub repository linked and updated

### Phase 2
- [ ] Tasks persist between sessions
- [ ] Timer history tracked
- [ ] State management implemented
- [ ] Statistics accurately calculated

### Phase 3
- [ ] All advanced features functional
- [ ] Notifications working
- [ ] Dark mode implemented
- [ ] Performance optimized

### Phase 4
- [ ] All tests passing
- [ ] App store ready
- [ ] Complete documentation
- [ ] User acceptance testing completed

---

## Conclusion

Phase 1 has established a solid foundation for the Tasky productivity app. All core UI components are in place with clean, maintainable code following Flutter best practices. The app demonstrates good design principles with consistent theming, responsive layouts, and intuitive navigation. The structured plan ensures systematic development across the remaining phases, with each phase building upon the previous work to create a comprehensive productivity solution.

**Repository**: https://github.com/PlumHeadd/SWAPD-402
**Phase 1 Completion Date**: November 14, 2025
