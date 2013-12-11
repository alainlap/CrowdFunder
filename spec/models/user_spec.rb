describe User do
	subject { create(:user) }

	its(:username) { should == 'Testuser' }
	its(:email) { should == 'test@test.com'}
	its(:city) { should == 'Springfield' }

	context 'duplicate username' do
		let(:user1) { User.create( username: 'user1', email: 'user1@test.com', password: '123') }
		subject { User.new( username: 'user1', email: 'user2@test.com', password: '123') }
		it { should_not be_valid }
	end

end