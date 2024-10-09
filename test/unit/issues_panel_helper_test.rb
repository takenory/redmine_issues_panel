require File.expand_path('../../test_helper', __FILE__)

class IssuesPanelHelperTest < Redmine::HelperTest
  include IssuesPanelHelper

  def test_icon_with_label
    unless defined?(IconsHelper)
      assert IssuesPanelHelper.instance_methods.include?(:icon_with_label)
      assert_equal 'label', icon_with_label('icon', 'label')
    else
      assert !IssuesPanelHelper.instance_methods.include?(:icon_with_label)
    end
  end

  def test_sprite_icon
    unless defined?(IconsHelper)
      assert IssuesPanelHelper.instance_methods.include?(:sprite_icon)
      assert_equal '', sprite_icon('icon')
    else
      assert !IssuesPanelHelper.instance_methods.include?(:sprite_icon)
    end
  end
end
