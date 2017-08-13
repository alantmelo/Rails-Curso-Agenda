namespace :utils do
  desc "Popular o banco de dados com valores falsos"
  task seed: :environment do
    puts "Cadastrando 5 contatos"
    5.times do |i|
        Contact.create name: Faker::Name.name,
        email: Faker::Internet.email,
        kind: Kind.all.sample, rmk: Faker::Lorem.paragraphs(1)
    end
    puts "Cadastrando 5 contatos...[ok]"
    
    puts "Cadastando 1 endereço para cada contato"
    Contact.all.each do |contact|
        Address.create street: Faker::Address.street_name,
        city: Faker::Address.city,
        state: Faker::Address.state, contact: contact
    end
    puts "Cadastrando 1 endereço para cada contato[OK]"
    
    puts "Cadastrando telefones para cada contato"
    
    Contact.all.each do |contact|
        Random.rand(1..3).times do |i|
          Phone.create phone: Faker::PhoneNumber.cell_phone,
          contact: contact
        end
    end
    
    puts "Cadastrando telefones para cada contato [OK]"
    
  end

end
