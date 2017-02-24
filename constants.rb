module CONST
	Token = ENV['BANDECO_BOT_TOKEN'].freeze
	PDF_DOMAIN = 'www.prefeitura.sc.usp.br'.freeze
	PDF_PATH =
			'/boletim_informegeral/pdf/'\
			'cardapio_semanal_restaurante_area_1.pdf'.freeze
	PDF_SHORT = 'http://goo.gl/v97wdA'.freeze
  API_PORT = 8273.freeze
	USERS_FILE = 'users.yaml'.freeze
	MENU_FILE = 'bandeco.pdf'.freeze
  DB_CONFIG = './db/config.yaml'.freeze
	MASTER_ID = 41_487_359
	PERIODS = [:lunch, :dinner].freeze
  CRON_EXP = {
    #lunch: '0 0 11 * MON-SAT *',
    lunch: '0 18 20 * * *',
    dinner: '0 0 17 * MON-FRI *'
  }
  SUBSCRIBE = {
    create: {
      true => 'Inscrição realizada com sucesso',
      false => 'Não foi possível realizar a inscrição',
    },
    destroy: {
      true => 'Inscrição removida com sucesso',
      false => 'Não foi possível remover a inscrição',
    }
  }
  PERIOD_HEADERS = /\A(?:Almoço \(\d\d?\/\d\d?\)|Jantar \(\d\d?\/\d\d?\)):/.freeze
	PARSE_MODE = 'Markdown'.freeze
	DATE_REGEX = %r{\d?\d\/\d?\d.*$}
	CLEAR_SCREEN = "\e[H\e[2J".freeze
  CHAT_TYPES = {
    private: 'private',
    group: 'group',
    channel: 'channel',
    supergroup: 'supergroup'
  }.freeze

  MAIN_COMMANDS = [
    'Próximo', 'Almoço',
    'Jantar', 'Cardápio',
    'Inscrever' 'Ajuda'
  ].freeze

	COMMANDS = {
      start: /\/start/i,
			help: /help|ajuda/i,
      next: /next|pr(?:ó|o)xim(?:o|a)/i,
			lunch: /almo(?:ç|c)o/i,
			dinner: /jantar?/i,
			menu: /card(?:a|á)pio/i,
			update: /update/i,
			tomorrow: /\bamanh(?:a|ã)\b/i,
      subscribe: /subscribe|inscrever/i,
      unsubscribe: /unsubscribe|des(?:in|en?)screver/,
			alguem: /\balgu(?:e|é)m\b/i
	}.freeze

	CONSOLE_COMMANDS = {
			users: /users/i,
			quit: /quit/i,
			restart: /res(?:tart|et)/i,
			download: /download|update/i,
			clear: /cl(?:ear|s|c)/i
	}.freeze

	CONSOLE_HASH = {
			inline_problem: 'Something went wrong in the inline query',
			chat_problem: 'Something went wrong in chat',
      welcome_problem: 'Something went wrong in the welcome message',
			bot_problem: 'Something went wrong in the bot communication',
			quitting: 'Quitting..',
			restarting: 'Restarting...',
			downloading: 'Downloading new pdf...',
			down_success: 'Success!',
			down_fail: 'Download Failed',
			invalid_command: 'Invalid command: %s',
			prompt: '>> '
	}.freeze

	TEXTS_HASH = {
    help:
      'Mandando qualquer mensagem para min, eu responderei'\
      " com o cardápio para o próximo bandejao\n\n" \
      'Alternativamente, os comandos /almoco e /janta'\
      ' seguidos por uma data retornam o cardápio do'\
      ' almoço/janta do dia representado pela data',
    start: 'olar',
    menu: "Cardapio: #{CONST::PDF_SHORT}",
    alguem: 'Alguém sim! Por isso vai ter fila!',
    inline_lunch_extra: ' no almoço',
    inline_dinner_extra: ' no jantar',
    inline_title_next: 'Mostrar cardápio do próximo bandejão',
    inline_title_specific: "Mostrar cardápio para dia %d/%d %s",
    inline_pdf: 'Mostrar pdf do cardápio da semana',
    error_message:
      "\nO bandejão está fechado ou o"\
      " cardápio ainda não foi atualizado.\n"\
      'Você pode olhar o link do cardapio para ter certeza: '\
      "#{CONST::PDF_SHORT}\n"\
      'Caso isso seja um erro, avise o @Kasama (t.me/Kasama)',
    fim_bandeco: 'O bandejão está fechado! Use /help para mais informações',
    pdf_update_success: 'PDF foi atualizado com sucesso',
    pdf_update_error: 'O PDF não foi atualizado',
    dinner_header: '*Jantar (%s/%s):*%s',
    lunch_header: '*Almoço (%s/%s):*%s',
    wtf: 'WTF!?'
	}.freeze

	# TODO: refactor this, DRY!
	# This module serves as a hash accessor
	module CONSOLE
			module_function

		def [](message, *params)
			CONSOLE_HASH[message] % params
		end
	end

	# This module serves as a hash accessor
	module TEXTS
			module_function

		def [](message, *params)
			TEXTS_HASH[message] % params
		end
	end
end
