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
- Tasks screen with complete CRUD functionality:
  - **Create**: Add tasks with title, description, priority, and due date
  - **Read**: Display all tasks in organized list view
  - **Update**: Toggle task completion status and importance flag
  - **Delete**: Remove tasks with delete button
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
**Milestone**: Implement persistent data storage and improved state management

**Planned Features:**
- Local data persistence using shared_preferences
- Task persistence across app sessions
- Timer session history tracking
- Task filtering (show all/completed/pending)
- Task sorting (by date, priority)
- Statistics calculation (completed tasks count, total focus time)

**Technical Goals:**
- Implement local storage for tasks and sessions
- Improve state management patterns
- Add input validation

---

### Phase 3 (Week 11) - Advanced Features and Polish
**Milestone**: Add enhanced functionality and improve user experience

**Planned Features:**
- Task categories or tags
- Timer completion alerts
- Dark mode toggle
- Task search by title
- Productivity statistics dashboard
- App settings page

**Technical Goals:**
- Implement theme switching
- Add sound/vibration for timer completion
- Optimize app performance
- Improve UI transitions

---

### Phase 4 (Week 13) - Testing and Finalization
**Milestone**: Complete testing and prepare final version

**Planned Activities:**
- Testing (widget tests for key features)
- Bug fixes and performance optimization
- Final UI polish and refinements
- App icon design
- Complete user documentation
- Final code review and cleanup

**Deliverables:**
- Tested and polished app
- User guide documentation
- Final presentation materials
- Clean, well-documented codebase

---

## 3. App Screenshots

### Home Screen
![Home Screen](screenshots/home_screen.png)

The home screen provides a welcoming dashboard with:
- Welcome message and motivational quote
- Quick stats display (Tasks Today, Focus Time, Streak)
- Three quick action buttons: Add Task, Start Timer, View Tasks

### Tasks Screen
![Tasks Screen](screenshots/tasks_screen.png)

The tasks screen enables complete task management with:
- Modal for adding new tasks with title, description, priority, and due date
- Task list showing all created tasks
- Complete CRUD operations (Create, Read, Update, Delete)

### Timer Screen
![Timer Screen](screenshots/timer_screen.png)

The focus timer screen includes:
- Large circular timer display with gradient styling
- Start, Pause, and Reset controls
- Saved sessions list with custom durations
- Create new session modal

---

## 4. Current Technical Implementation

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
- Complete CRUD operations:
  - **Create**: Task creation modal with title, description, important/urgent checkbox, and due date/time picker
  - **Read**: Scrollable task list with all task details visible
  - **Update**: Toggle buttons to mark tasks as finished or important
  - **Delete**: Delete button (trash icon) to remove tasks from list
- Task list features:
  - Numbered tasks with auto-incrementing IDs
  - Priority indicators (red avatar for important, purple for normal)
  - Strike-through styling for completed tasks
  - Truncated descriptions (2 lines max) with ellipsis
  - Created and due date timestamps displayed
- Empty state message when no tasks exist
- Floating action button for quick task addition

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
Additional features like categories, dark mode, and search added for better usability.

### Phase 4 Polish
Final testing, bug fixes, and documentation completed.

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
- [ ] Categories or tags implemented
- [ ] Dark mode working
- [ ] Search functionality added
- [ ] Statistics displayed

### Phase 4
- [ ] Widget tests created
- [ ] All bugs fixed
- [ ] App icon designed
- [ ] Documentation completed

---

## Conclusion

Phase 1 has established a solid foundation for the Tasky productivity app. All core UI components are in place with clean, maintainable code following Flutter best practices. The app demonstrates good design principles with consistent theming, responsive layouts, and intuitive navigation. The structured plan ensures systematic development across the remaining phases, with each phase building upon the previous work to create a comprehensive productivity solution.

**Repository**: https://github.com/PlumHeadd/SWAPD-402
**Phase 1 Completion Date**: November 14, 2025
