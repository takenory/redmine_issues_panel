module IssuesPanelHelper

  def _project_issues_panel_path(project, *args)
    if project
      project_issues_panel_path(project, *args)
    else
      issues_panel_path(*args)
    end
  end

  # Workaround for Redmine changes in trunk@22988
  unless defined?(IconsHelper)
    def icon_with_label(icon_name, label_text, options = {})
      label_text
    end
    def sprite_icon(icon_name)
      ''
    end
  end
end
