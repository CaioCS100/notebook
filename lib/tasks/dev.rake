namespace :dev do
  desc 'Set up the development environment'
  task setup: :environment do
    if Rails.env.development?
      show_successful_spinner('Deleting database...') { %x(rails db:drop) }
      show_successful_spinner('Creating database...') { %x(rails db:create) }
      show_successful_spinner('Migrating tables to database...') { %x(rails db:migrate) }
      %x(rails dev:create_contacts)
    else
      show_error_spinner('Deleting database...', 'you must be using the development environment')
    end
  end

  desc 'Create some Contacts for tests'
  task create_contacts: :environment do
    if Rails.env.development?
      show_successful_spinner('Creating Contacts') do
        10.times do
          Contact.create!(
            name: Faker::Name.name,
            email: Faker::Internet.email,
            birthdate: Faker::Date.between(from: 80.years.ago, to: Date.today)
          )
        end
      end
    else
      show_error_spinner('Error!', 'you must be using the development environment')
    end
  end

  private

  def show_successful_spinner(msg_initial, msg_end = 'Successful!')
    spinner = TTY::Spinner.new("[:spinner] #{msg_initial}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end

  def show_error_spinner(msg_initial, msg_end = 'error!')
    spinner = TTY::Spinner.new("[:spinner] #{msg_initial}")
    spinner.auto_spin
    spinner.error("(#{msg_end})")
  end
end
