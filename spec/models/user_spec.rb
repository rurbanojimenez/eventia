require 'spec_helper'

describe User do
	before do
		@usuario = User.new(
			name: "Adolf",
			email: "jews@love.com",
			password: "12345678",
			password_confirmation: "12345678"
		)
	end

	subject {@usuario}

	it {should respond_to(:name)}
	it {should respond_to(:email)}
	it {should respond_to(:password)}
	it {should respond_to(:password_confirmation)}
end
