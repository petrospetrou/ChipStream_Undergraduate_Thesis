## Developer Guide for Modifying ChipStream

This guide is intended for developers working on the ChipStream project, built using Qt 5.15.2 with QMake. The project integrates both Qt Widgets and Qt Quick for a rich user interface experience, including custom components for terminal interaction, input parameter configuration, logging activities, and a custom top bar.

### Project Structure

- **QML Pages**: Four main QML files define the UI:
  - `Terminal.qml`: Embeds a terminal within the application.
  - `InputParam.qml`: Handles user input for various parameters.
  - `LogActivity.qml`: Displays application logs.
  - `TopBar.qml`: Provides a custom title bar with system controls.

- **C++ Classes**: Two main classes handle backend logic:
  - `Collector`: Collects data from `InputParam.qml`.
  - `LogManager`: Manages log entries for `LogActivity.qml`.

### Modifying QML Pages

#### TopBar.qml
- **Customization**: To customize the title or appearance, adjust properties within the `Label` and `Rectangle` components.
- **System Controls**: Modify `RoundButton` components to alter the look or behavior of the close and minimize buttons.

#### Terminal.qml
- To integrate with `qmltermwidget`, ensure the library is installed. Modify terminal settings directly within the `QMLTermWidget` component.
- **Shortcut Actions**: Adjust `Action` components to change keyboard shortcuts or add new ones.

#### InputParam.qml
- **Parameter Fields**: Modify `TextField` components to change input fields, validators, or default values.
- **Layout and Appearance**: Adjust `Row` and `Column` layouts for spacing or alignment. Customize `Rectangle` components for background or border appearances.

### Modifying C++ Classes

#### Collector
- **Data Collection**: To modify data handling, adjust the `collectData` method. This includes changing parameter types or processing logic.
- **Integration with QML**: Use `Q_INVOKABLE` to expose new methods to QML. Adjust signal-slot connections as needed for dynamic UI updates.

#### LogManager
- **Log Management**: Modify `addLog` and `clearLogs` methods to change how logs are handled or stored.
- **QML Interaction**: Leverage signals (`logMessagesChanged`) to notify QML of updates. Adjust the `QStringList` model as needed for additional data handling.

### Integrating with main.cpp

- **Window Setup**: Modify the `ApplicationWindow` setup in `main.qml` to change initial dimensions, visibility, or window flags.
- **Context Properties**: To expose new C++ objects to QML, use `rootContext()->setContextProperty()` in `main.cpp`.
- **Signal-Slot Connections**: Adjust connections between QML components and C++ objects for data collection or UI updates.

### Additional Tips

- <code style="color : red">Note</code>: I have added a test example for on the "Auto - Fill Sequence" button in InputParam.qml comment that out when you test it. Same in the main.cpp on line 59

- **QML TermWidget**: For any issues with the terminal widget, refer to the [qmltermwidget GitHub page](https://github.com/Swordfish90/qmltermwidget) for troubleshooting and advanced configurations.
- **Qt Documentation**: Leverage the extensive [Qt documentation](https://doc.qt.io/) for in-depth guides on Qt Quick, Qt Widgets, and integrating C++ logic with QML.
