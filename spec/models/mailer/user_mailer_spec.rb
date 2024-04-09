# require 'rails_helper'


# RSpec.describe "Mailer::UserMailer", type: :mailer do  # Replace "YourClassHere" with the actual class name

#     let!(:user) {FactoryBot.create(:user) }
#     let!(:booking) {FactoryBot.create(:booking) }
#     let(:mail) {  UserMailer.conformation(@booking).deliver_now }
    
  
#     it 'renders the receiver email' do
#       expect(mail.to).to eq([booking.user.email])
#     end
#     # it 'renders the subject' do
#     #   expect(mail.subject).to eq('verification code')
#     # end
#     # it 'renders the sender email' do
#     #   expect(mail.from).to eq(['mutebigod10@gmail.com'])
#     # end

#     # describe "#confirmation" do
#     #    let!(:booking) {FactoryBot.create(:booking) }
#     #    let(:mail) {  UserMailer.conformation(@booking).deliver_now }
#     #     it "sends a confirmation email to the user" do
#     #         expect { subject.confirmation(booking) }.to deliver_mail(to: booking.user.email)
#     #         expect(ActionMailer::Base.deliveries.last.subject).to eq("Vehicle Booking Confirmation")
#     #     end
#     # end
  
# end