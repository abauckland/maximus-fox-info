module RefsystemSettings
  extend ActiveSupport::Concern

    included do
      before_filter :set_reference_system
    end

    def set_reference_system
      api_account = Api.where(:user_id => current_user).first.client

      @client_name = api_account.client
      @client_model = api_account.client.classify.constantize
      @ref_system_name = api_account.ref_system
      @ref_system_model = api_account.ref_system.classify.constantize            
    end

end