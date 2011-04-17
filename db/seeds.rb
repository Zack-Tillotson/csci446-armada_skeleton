# Clear previous information.
User.delete_all
Role.delete_all
Harvester.delete_all

PaperTrail.whodunnit = 'Seed Data Script'

# Seed the roles.
Role.create!(:name => 'developer', :description => 'The system developer. There is no higher access level.')
Role.create!(:name => 'administrator', :description => 'A system administrator. Full access to all features.')
Role.create!(:name => 'member', :description => 'A typical application user.')


# Seed developer users.
r = Role.find_by_name('developer')

team_member_1 = User.new(:first_name => 'Zack',
                         :last_name => 'Tillotson',
                         :email => 'ztillots@mines.edu',
                         :password => 'changeme',
                         :password_confirmation => 'changeme',
                         :role => r)
team_member_1.save_without_session_maintenance

team_member_2 = User.new(:first_name => 'Kyle',
                         :last_name => 'Schulz',
                         :email => 'ryoken@ryoken.net',
                         :password => 'dragon',
                         :password_confirmation => 'dragon',
                         :role => r)
team_member_2.save_without_session_maintenance

yong = User.new(:first_name => 'Yong',
                :last_name => 'Bakos',
                :email => 'ybakos@mines.edu',
                :password => 'changeme',
                :password_confirmation => 'changeme',
                :role => r)
yong.save_without_session_maintenance

# Seed harvesters.
Harvester.create!(
	:user_id => team_member_1.id,
	:name => 'Test Harvester 1',
	:price => 1.1,
	:description => 'Test description.',
	:photo => File.open(File.join(Rails.root, '/test/default.png')))

Harvester.create!(
	:user_id => team_member_2.id,
	:name => 'Test Harvester 2',
	:price => 2.2,
	:description => 'Test description.',
	:photo => File.open(File.join(Rails.root, '/test/default.png')))

Harvester.create!(
	:user_id => yong.id,
	:name => 'Test Harvester 3',
	:price => 3.3,
	:description => 'Test description.',
	:photo => File.open(File.join(Rails.root, '/test/default.png')))