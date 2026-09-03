import sublime
import sublime_plugin

class StatusBarFilePathListener(sublime_plugin.EventListener):
    def on_activated_async(self, view):
        self.update_status_bar(view)
        
    def on_post_save_async(self, view):
        self.update_status_bar(view)

    def update_status_bar(self, view):
        file_path = view.file_name()
        if file_path:
            # Displays the full path in the bottom status bar
            view.set_status('current_file_path', file_path)
        else:
            view.set_status('current_file_path', 'Unsaved File')
