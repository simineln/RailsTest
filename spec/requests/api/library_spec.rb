require 'swagger_helper'

RSpec.describe 'api/library', type: :request do

    path '/libraries' do

    post 'Adds new library' do
      tags 'Libraries'
      consumes 'application/json'
      parameter name: :library, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          address: { type: :string },
          description: { type: :string}
        },
        required: [ 'name', 'address', 'description' ]
      }

      response '201', 'library added' do
        let(:library) { { name: 'foo', address: 'bar', description: 'foobar' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:library) { { name: 'foo' } }
        run_test!
      end
    end
  end


  path '/libraries/{id}' do

    delete 'Delete a library' do
      tags 'Libraries'
      consumes 'application/json', 'application/xml'
      produces 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :string
      
      response '200', 'Library deleted' do
        let(:id) {create(:library).id}

        run_test!
      end
    end
  end


end
