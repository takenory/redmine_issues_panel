require_dependency 'queries_helper'

module IssuesPanel
  module QueriesHelperPatch
    def self.included(base)
      base.send(:prepend, InstanceMethods)
      base.class_eval do
        #unloadable
      end
    end

    module InstanceMethods
      def retrieve_query(klass=IssueQuery, use_session=true, options={})
        super
        session_key = klass.name.underscore.to_sym
        if params[:query_id].nil? && use_session && session[session_key]
          if params[:set_filter]
            session[session_key][:options] = @query.options
          else
            @query.options = session[session_key][:options]
          end
        end
        @query
      end
    end
  end
end

Rails.configuration.to_prepare do
  QueriesHelper.include IssuesPanel::QueriesHelperPatch
end
