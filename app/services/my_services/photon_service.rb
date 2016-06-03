require 'net/https'
require 'uri'

module MyServices
    class PhotonService
        def initialize()
            @uri = URI.parse(get_link("none"))

            # @pem_path = "/etc/ssl/certs/"
            # @pem_file = "ca-certificates.crt"
            @pem_path = "/usr/local/etc/openssl/"
            @pem_file = "cert.pem"
        end

        def test_fire(state)

            token = ENV['particle_token']


            device = ENV['particle_device']

            request = Net::HTTP::Post.new(get_link(device), get_headers(token))
            #request['User-Agent'] = 'Johns sage web app'
            body_data = URI.encode_www_form({args: state})
            request.body = body_data

            response = make_request(request)

            if response.code == "200"
                puts "PHOTON PASSED"
             else
                puts "PHOTON FAILED"
                puts response.code
            end
        end

        def make_request(request)
            http = get_secure_http()
            return http.request(request)
        end

        def get_link(device)
            return "https://api.particle.io/v1/devices/#{device}/led"
        end

        def get_headers(token)
            return {
                'Authorization' => "Bearer #{token}",
                #'Accept' => "application/json"
            }
        end

        def get_secure_http()
            http = Net::HTTP.new(@uri.host, @uri.port)
            http.use_ssl = true
            http.cert = get_ca_cert()
            http.verify_mode = OpenSSL::SSL::VERIFY_PEER

            return http
        end

        def get_ca_cert()
            pem = File.read(@pem_path + @pem_file)
            return OpenSSL::X509::Certificate.new(pem)
        end
    end
end
