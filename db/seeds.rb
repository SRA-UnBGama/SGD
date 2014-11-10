# COMPETÊNCIA
Competence.create ([{ :name  => "Presta atendimento aos cidadãos,
 	sem distinção ou preconceito, com cortesia,    precisão e agilidade 
 	baseando-se no interesse público e nas normas internas da UnB.", 
 	:category => "Fundamental", :is_active => true}])


Competence.create ([{ :name =>"Redige textos, sem erros, utilizando 
	aplicativos de textos e baseando-se nas normas de Redação Oficial." ,
	:category=> "Fundamental",:is_active => true}])

Competence.create ([{ :name =>"Utiliza sistemas informatizados corretamente
	 de modo a facilitar a recuperação das informações."  ,
	 :category=> "Fundamental",:is_active => true}])

Competence.create ([{ :name =>"Demonstra iniciativa para solucionar os 
	problemas referentes à sua área de atuação de forma oportuna e respeitando 
	o fluxo de processos na Universidade e a respectiva legislação." ,
	:category=> "Fundamental",:is_active => true}])

Competence.create ([{ :name =>"Colabora com os colegas de trabalho, de 
	modo a favorecer um clima de respeito e harmonia.",
	:category=> "Fundamental",:is_active => true}])

Competence.create ([{ :name =>"Estabelece metas, acompanha e avalia o desempenho
	da equipe identificando as necessidades de capacitação
	a partir das lacunas de competências.",
	:category=> "Gerencial",:is_active => true}])

Competence.create ([{ :name =>"Busca solucionar problemas referentes às condições
	do ambiente físico de trabalho (ventilação, iluminação,
	móveis ergonômicos, recursos materiais etc.) e
	condições socioprofissionais (clima organizacional,
	relacionamento interpessoal, qualidade de vida etc.).",
	:category=> "Gerencial",:is_active => true}])

Competence.create ([{ :name =>"Estabelece responsabilidades individuais considerando
	as competências da equipe, promovendo um ambiente
	participativo e de compartilhamento de conhecimento.",
	:category=>"Gerencial",:is_active => true}])

Competence.create ([{ :name =>"Planeja as ações da área em que atua, em conformidade
	com os prazos estabelecidos e o orçamento previsto,
	tendo em vista os princípios orçamentários e as noções
	básicas de contabilidade, vinculando ao planejamento
	institucional.",
	:category=> "Gerencial",:is_active => true}])

Competence.create ([{ :name =>"Fornece, ao superior imediato, informações relevantes à
	tomada de decisão, considerando os aspectos legais e as
	estratégias da área.",
	:category=> "Gerencial",:is_active => true}])


# SOLUÇÕES DE APRENDIZAGEM
LearningSolution.create([{ :description => "Aprendizagem em serviço da operalização dos sistemas
	pertinentes à área.",:category => "Presencial"}])

LearningSolution.create([{ :description => "Curso a distância de Ética no Serviço.",:category => "À Distância"}])

LearningSolution.create([{ :description => "Curso a distância de Atendimento ao Cidadão.",:category => "À Distância"}])

LearningSolution.create([{ :description => "Formação Gerencial.",:category => "Presencial"}])

LearningSolution.create([{ :description => "Curso a distância de Legislação Aplicada à Gestão de
	Pessoas Lei nº 8.112/90.",:category => "À Distância"}])

LearningSolution.create([{ :description => "Curso a distância de Redação Oficial.",:category => "À Distância"}])

LearningSolution.create([{ :description => "Reuniões em que todos tenham oportunidade de participação.",
	:category => "Presencial"}])

LearningSolution.create([{ :description => "Curso a distância de Informática Básica - Módulo Windows e Word.",
	:category => "À Distância"}])

LearningSolution.create([{ :description => "Leitura e compreensão do novo acordo ortográfico.",:category => "Presencial"}])

LearningSolution.create([{ :description => "Orientação no trabalho quanto às práticas colaborativas.",
	:category => "Presencial"}])


# CONDIÇÕES DE TRABALHO
WorkingCondition.create([{:name => "O ambiente é confortável."}])
WorkingCondition.create([{:name => "Há silêncio necessário para a realização do trabalho."}])
WorkingCondition.create([{:name => "O mobiliário existente no local de trabalho é adequado."}])
WorkingCondition.create([{:name => "Os instrumentos de trabalho são suficientes para realizar as atividades."}])
WorkingCondition.create([{:name => "O espaço físico é adequado para realiazar os processos de trabalho."}])
WorkingCondition.create([{:name => "O ambiente de trabalho oferece segurança física às pessoas"}])
WorkingCondition.create([{:name => "O material de consumo é suficiente."}])

# USUÁRIOS
#
# Apenas a nível de DESENVOLVIMENTO
# TODO: Excluir assim que o LDAP estiver disponível
User.create( :name_user => "THAIANE", :fub_registry => "123", :siape_registry => "123", :cost_center =>  "LAPPIS", 
	:admission_date => "2015-03-10", :password => "123456", :password_confirmation => "123456", :is_active_user => true )
User.create( :name_user => "TOMAZ", :fub_registry => "123", :siape_registry => "123", :cost_center =>  "LAPPIS", 
	:admission_date => "2015-03-10", :password => "123456", :password_confirmation => "123456", :is_active_user => true )
User.create( :name_user => "MAXWELL", :fub_registry => "123", :siape_registry => "123", :cost_center =>  "LAPPIS", 
	:admission_date => "2015-03-10", :password => "123456", :password_confirmation => "123456", :is_active_user => true )
User.create( :name_user => "JOAO", :fub_registry => "123", :siape_registry => "123", :cost_center =>  "LAPPIS", 
	:admission_date => "2015-03-10", :password => "123456", :password_confirmation => "123456", :is_active_user => true )

User.create( :name_user => "MARSICANO", :fub_registry => "123", :siape_registry => "123", :cost_center =>  "FGA", 
	:admission_date => "2015-03-10", :password => "123456", :password_confirmation => "123456", :is_active_user => true )
User.create( :name_user => "MILENE", :fub_registry => "123", :siape_registry => "123", :cost_center =>  "FGA", 
	:admission_date => "2015-03-10", :password => "123456", :password_confirmation => "123456", :is_active_user => true )
User.create( :name_user => "HILMER", :fub_registry => "123", :siape_registry => "123", :cost_center =>  "FGA", 
	:admission_date => "2015-03-10", :password => "123456", :password_confirmation => "123456", :is_active_user => true )

User.create( :name_user => "LILIAN", :fub_registry => "123", :siape_registry => "123", :cost_center =>  "FCE", 
	:admission_date => "2015-03-10", :password => "123456", :password_confirmation => "123456", :is_active_user => true )
User.create( :name_user => "CARMEN", :fub_registry => "123", :siape_registry => "123", :cost_center =>  "FCE", 
	:admission_date => "2015-03-10", :password => "123456", :password_confirmation => "123456", :is_active_user => true )
User.create( :name_user => "CASSANDRA", :fub_registry => "123", :siape_registry => "123", :cost_center =>  "FCE", 
	:admission_date => "2015-03-10", :password => "123456", :password_confirmation => "123456", :is_active_user => true )

User.create( :name_user => "TAYGUARA", :fub_registry => "123", :siape_registry => "123", :cost_center =>  "FT", 
	:admission_date => "2015-03-10", :password => "123456", :password_confirmation => "123456", :is_active_user => true )
User.create( :name_user => "RUDI", :fub_registry => "123", :siape_registry => "123", :cost_center =>  "FT", 
	:admission_date => "2015-03-10", :password => "123456", :password_confirmation => "123456", :is_active_user => true )
User.create( :name_user => "MARIANA", :fub_registry => "123", :siape_registry => "123", :cost_center =>  "FT", 
	:admission_date => "2015-03-10", :password => "123456", :password_confirmation => "123456", :is_active_user => true )

User.create( :name_user => "FABRICIO", :fub_registry => "123", :siape_registry => "123", :cost_center =>  "IB", 
	:admission_date => "2015-03-10", :password => "123456", :password_confirmation => "123456", :is_active_user => true )
User.create( :name_user => "KAREM", :fub_registry => "123", :siape_registry => "123", :cost_center =>  "IB", 
	:admission_date => "2015-03-10", :password => "123456", :password_confirmation => "123456", :is_active_user => true )

User.create( :name_user => "KARINE", :fub_registry => "123", :siape_registry => "123", :cost_center =>  "CQTS", 
	:admission_date => "2015-03-10", :password => "123456", :password_confirmation => "123456", :is_active_user => true )
User.create( :name_user => "VICTOR", :fub_registry => "123", :siape_registry => "123", :cost_center =>  "CQTS", 
	:admission_date => "2015-03-10", :password => "123456", :password_confirmation => "123456", :is_active_user => true )
User.create( :name_user => "LARISSA", :fub_registry => "123", :siape_registry => "123", :cost_center =>  "CQTS", 
	:admission_date => "2015-03-10", :password => "123456", :password_confirmation => "123456", :is_active_user => true )