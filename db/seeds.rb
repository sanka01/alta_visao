# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


estados = Estado.create([{sigla: "AC", nome: "Acre"},
               {sigla: "AL", nome: "Alagoas"},
               {sigla: "AP", nome: "Amapá"},
               {sigla: "AM", nome: "Amazonas"},
               {sigla: "BA", nome: "Bahia"},
               {sigla: "CE", nome: "Ceará"},
               {sigla: "DF", nome: "Distrito Federal"},
               {sigla: "ES", nome: "Espírito Santo"},
               {sigla: "GO", nome: "Goiás"},
               {sigla: "MA", nome: "Maranhão"},
               {sigla: "MT", nome: "Mato Grosso"},
               {sigla: "MS", nome: "Mato Grosso do Sul"},
               {sigla: "MG", nome: "Minas Gerais"},
               {sigla: "PA", nome: "Pará"},
               {sigla: "PB", nome: "Paraíba"},
               {sigla: "PR", nome: "Paraná"},
               {sigla: "PE", nome: "Pernambuco"},
               {sigla: "PI", nome: "Piauí"},
               {sigla: "RJ", nome: "Rio de Janeiro"},
               {sigla: "RN", nome: "Rio Grande do Norte"},
               {sigla: "RS", nome: "Rio Grande do Sul"},
               {sigla: "RO", nome: "Rondônia"},
               {sigla: "RR", nome: "Roraima"},
               {sigla: "SC", nome: "Santa Catarina"},
               {sigla: "SP", nome: "São Paulo"},
               {sigla: "SE", nome: "Sergipe"},
               {sigla: "TO", nome: "Tocantins"}])

usuarios = Usuario.create([{nome: "Jean Paula Alves	", associado: true, indicacao: 0},
                {nome: "Wellington da Silva", associado: true, indicacao: 0},
                {nome: "Rafael Alves Batista	", associado: true, indicacao: 0},
                {nome: "Celia da Silva", associado: true, indicacao: 0}
               ])

franquias = Franquia.create([{nome: "001", usuario_id: 1},
                 {nome: "002", usuario_id: 2},
                 {nome: "003", usuario_id: 3},
                 {nome: "004", usuario_id: 4}])

