require 'spec_helper'

describe User do
	before do
		@user = User.new(
			name: "Adolf",
			email: "adolf@adolf.com",
			password: "12345678",
			password_confirmation: "12345678"
		)
	end

	subject {@user}

	it {should respond_to(:name)}
	it {should respond_to(:email)}
	it {should respond_to(:password)}
	it {should respond_to(:password_confirmation)}
	it {should respond_to(:mis_eventos)}
	it {should respond_to(:eventos_seguidos)}
	its(:id) { should_not be_blank }
	its(:eventos_seguidos) {should be_blank}
	it {should be_valid}

	describe "when name is invalid" do
		before { @user.name = "adolf" }
		it { should_not be_valid }
	end

	describe "when pass is too short" do
		before { @user.password = "1234567" }
		it { should_not be_valid }
	end

	describe "when following a an event" do
	  before { @user.eventos_seguidos.build(
	  		mi_creador_id: @user.id,
	  		title: "asdfasdf"
	  )}

	  it { should be_valid }
	end
end
