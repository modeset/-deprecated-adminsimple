require 'spec_helper'

describe Adminsimple::Configuration do

  subject { described_class }
  it 'defines the user model name' do
    expect(subject.devise_model).to eq(:admin)
  end

  it 'allows configuration for omniauth' do
    Adminsimple::Configuration.devise_options = {omniauth_callbacks: 'adminsimple/devise/omniauth_callbacks'}
    expect(subject.devise_options).to include(omniauth_callbacks: 'adminsimple/devise/omniauth_callbacks')
  end
end