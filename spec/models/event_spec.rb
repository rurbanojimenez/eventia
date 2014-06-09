require 'spec_helper'
describe Event do 
	before do
		User.destroy_all
		Event.destroy_all
		@user = User.create!(
			name: "Adolf",
			email: "adolf@adolf.com",
			password: "12345678",
			password_confirmation: "12345678"
		)

		@event = Event.create!(
			mi_creador_id: @user.id,
			title: "titulassso"
		)
	end

	#after do
		
	#end

	describe "when an update contains follower_id" do
		it "should do NOTHING if no follower_id" do
			expect {
				@event.update_attributes follower_id: nil
			}.to_not change(@event.followers, :count).by(1)
			@event.should_not have(1).error_on :follower_id
		end

		it "should fail if follower_id is invalid" do
			@event.update_attributes follower_id: "cristomal"
			@event.should have(1).error_on :follower_id
		end

		it "should add a follower to the relationship if the follower_id is valid" do
			expect {
				@event.update_attributes follower_id: @user.id
				@event.reload
			}.to change(@event.followers, :count).by(1)
		end
	end
	
	describe "when an update contains unfollower_id" do
		before do
			@event.update_attributes follower_id: @user.id
			@event.reload
		end
		it "should do NOTHING if no unfollower_id" do
			expect {
				@event.update_attributes unfollower_id: nil
			}.to_not change(@event.followers, :count).by(-1)
			@event.should_not have(1).error_on :unfollower_id
		end

		it "should fail if unfollower_id is invalid" do
			expect {
				@event.update_attributes unfollower_id: nil
			}.to_not change(@event.followers, :count).by(-1)
			@event.should_not have(1).error_on :unfollower_id
		end

		it "should quit a follower to the relationship if the unfollower_id is valid" do
			expect {
				@event.update_attributes unfollower_id: @user.id.to_s
				@event.reload
			}.to change(@event.followers, :count).by(-1)
		end
	end
end