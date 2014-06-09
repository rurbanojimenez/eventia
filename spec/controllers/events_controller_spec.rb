require 'spec_helper'
describe EventsController do
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

		sign_in @user
	end

	describe "when put update" do
		it "should return 204 if update is successful" do
			put :update, id: @event.id, event: {follower_id: @user.id}, format: "json"
			response.status.should eql 204
		end
		it "should return 422 if update isn't successful" do
			put :update, id: @event.id, event: {follower_id: "cristomal"}, format: "json"
			response.status.should eql 422
		end
	end
end