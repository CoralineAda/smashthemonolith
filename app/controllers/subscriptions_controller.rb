class SubscriptionsController < ApplicationController

  before_filter :scope_subscription

  def index
    @unsaved = true
  end

  def create
    @subscription.save && @subscription.register_with_mailchimp && @unsaved = nil
    render :index
  end

  private

  def scope_subscription
    @subscription = Subscription.new({:message => 'Your email address'}.merge(params[:subscription] || {}))
    @subscription.message = @subscription.errors.messages.first unless @subscription.email.present? && @subscription.valid?
  end

end