require 'rails_helper'

RSpec.describe FlashMessenger::Messages::Base do
  subject { FlashMessenger::Messages::Base }

  let(:default_translation) { 'development.lorem_ipsum_1' }
  let(:default_message) { I18n.t(default_translation) }
  let(:default_level) { :notice }
  let(:default_params) { { test: 'foo' } }

  context 'with vanilla messages' do
    let(:new_with_message) do
      subject.new(default_level, default_message, default_params)
    end

    context '#new' do
      it 'returns a new FlashMessenger::Messages::Nonpersistent object' do
        expect(new_with_message).to be_a(subject)
      end

      it 'is defines the interface' do
        expect { new_with_message.persistent? }.to raise_error(NotImplementedError)
      end

      it_behaves_like 'a message instance of kind', :subject, :new_with_message
    end
  end

  context 'with i18n translations' do
    let(:new_with_translation) do
      subject.new(default_level, default_translation, default_params)
    end

    context '#new' do
      it 'returns a new FlashMessenger::Messages::Nonpersistent object' do
        expect(new_with_translation).to be_a(subject)
      end

      it 'is defines the interface' do
        expect { new_with_translation.persistent? }.to raise_error(NotImplementedError)
      end

      it_behaves_like 'a message instance of kind', :subject, :new_with_translation
    end
  end
end
