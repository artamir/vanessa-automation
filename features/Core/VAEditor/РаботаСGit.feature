﻿# language: ru


@IgnoreOn82Builds
@IgnoreOnOFBuilds
@IgnoreOnUFSovm82Builds
@IgnoreOnWeb

@IgnoreOn836
@IgnoreOn837
@IgnoreOn838
@IgnoreOn839
@IgnoreOn8310
@IgnoreOn8311
@IgnoreOn8312
@IgnoreOn8313
@IgnoreOn8314
@IgnoreOn8315
@IgnoreOn8316

@ServerCodeCoverage


Функциональность: Работа с Git

	Как разработчик
	Я хочу чтобы в Vanessa Automation можно было работать с git репозиторием
	Чтобы я мог сразу сохранять свои изменения в git

Контекст: 
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	Когда Я открываю VanessaAutomation в режиме TestClient со стандартной библиотекой 'VAEditor'

	//Инициализация репо Git
	И Я запоминаю строку '$КаталогИнструментов$/temp/testrepo' в переменную "КаталогРепо"
	Если файл "$КаталогРепо$" существует тогда
		И я очищаю каталог "$КаталогРепо$"
	Иначе	
		И я создаю каталог "$КаталогРепо$"
	И Пауза 1

	И я выполняю команду системы
		|'CD $КаталогРепо$'|
		|'git init'|
	И Пауза 1
		
	

Сценарий: Проверка основных действий при работе с git
	* Создание нового файла в репо
		
		Затем я создаю файл "$КаталогРепо$/111.txt"
			|'111'|
			|'222'|

	* Установка проекта
		И я перехожу к закладке с именем "ГруппаНастройки"
		И в поле с именем 'КаталогПроекта' я ввожу текст '$КаталогРепо$'
		И я перехожу к следующему реквизиту

	* Включение компоненты
		И я устанавливаю флаг с именем 'ИспользоватьКомпонентуVanessaExt'
		И Пауза 1
					

	* Переход в панель работы с git
		И я перехожу к закладке с именем "ГруппаДополнительно"
		И я очищаю окно сообщений пользователю
		И я нажимаю на кнопку с именем 'ПодготовитьСценарийКВыполнению'
		Затем я жду что в сообщениях пользователю будет подстрока "ВозможнаОптимизацияЗагрузкиФичи" в течение 30 секунд
		И я очищаю окно сообщений пользователю
		И я перехожу в редактор Vanessa Automation из дерева
		Затем я жду что в сообщениях пользователю будет подстрока "ВозможнаОптимизацияЗагрузкиФичи" в течение 30 секунд
		И я очищаю окно сообщений пользователю

		И я нажимаю на кнопку с именем 'VanessaEditorПоказатьСкрытьДеревоGit'

		И Пауза 1

		Тогда таблица "ДеревоGit" стала равной:
			| 'Файл'                                                                         |
			| 'Unstaged'                                                                     |
			| '111.txt'                                                                      |

	* Установка данных коммитера
		И я нажимаю на кнопку с именем 'ДеревоGitНастройки'
		Тогда открылось окно 'Настройки Git'
		И я перехожу к закладке с именем "SignaturePage"
		И я нажимаю на кнопку с именем 'GetSignature'
		И Пауза 1
		И в поле с именем 'SignatureName' я ввожу текст 'Test user'
		И я перехожу к следующему реквизиту
		И в поле с именем 'SignatureEmail' я ввожу текст 'test@test.ru'
		И я нажимаю на кнопку с именем 'SetSignatureAuthor'
		И Пауза 1
		И я нажимаю на кнопку с именем 'УстановитьКоммитера'
		И Пауза 1
		И я нажимаю на кнопку с именем 'ФормаЗакрыть'
		Тогда открылось окно '*Vanessa Automation*'
				
						
	* Добавление файла в индекс
		И в таблице "ДеревоGit" я перехожу к строке
				| 'Файл'    |
				| '111.txt' |
		
		И я нажимаю на кнопку с именем 'ДеревоGitДобавитьВИндекс'
		И Пауза 1
		Тогда таблица "ДеревоGit" стала равной:
			| 'Файл'     |
			| 'Staged'   |
			| '111.txt'  |
			| 'Unstaged' |
		
	* Коммит файла
		И в таблице "ДеревоGit" я перехожу к строке
				| 'Файл'    |
				| '111.txt' |
		И в поле с именем 'ДеревоGitДеревоТекстСообщения' я ввожу текст 'Первый коммит'
		И я нажимаю на кнопку с именем 'ДеревоGitДеревоGitЗафиксировать'
		И Пауза 1
		
		Тогда таблица "ДеревоGit" стала равной:
			| 'Файл'     |
			| 'Unstaged' |
		
							
	* Создание второго файла
		Затем я создаю файл "$КаталогРепо$/222.txt"
			|'333'|
			|'444'|

	* Обновление статуса репо
		И я нажимаю на кнопку с именем 'ДеревоGitОбновить'
		И Пауза 1
		Тогда таблица "ДеревоGit" стала равной:
			| 'Файл'     |
			| 'Unstaged' |
			| '222.txt'  |
	

	* Добавление в индекс второго файла
		И в таблице "ДеревоGit" я перехожу к строке
				| 'Файл'    |
				| '222.txt' |

		И я нажимаю на кнопку с именем 'ДеревоGitДобавитьВИндекс'
		И Пауза 1
		Тогда таблица "ДеревоGit" стала равной:
			| 'Файл'     |
			| 'Staged'   |
			| '222.txt'  |
			| 'Unstaged' |
		
	* Проверка перехода к изменениям
		И в таблице "ДеревоGit" я перехожу к строке
				| 'Файл'    |
				| '222.txt' |
		И Пауза 2
		И я нажимаю на кнопку с именем 'VanessaEditorПоказыватьРазличияВРедактореОтдельно'
		И Пауза 2
		И я нажимаю на кнопку с именем 'VanessaEditorPreviousDiff'
		И Пауза 1
		И я нажимаю на кнопку с именем 'VanessaEditorNextDiff'
		И Пауза 1
		
				

	

	* Удаление из индекса файла			
		И я нажимаю на кнопку с именем 'ДеревоGitДеревоGitУбратьИзИндекса'
		И Пауза 1
		
		Тогда таблица "ДеревоGit" стала равной:
			| 'Файл'     |
			| 'Unstaged' |
			| '222.txt'  |
		
	* Создание ветки develop
		И я нажимаю на кнопку с именем 'ДеревоGitВыборВетки'
		И я выбираю из списка '<Создать новую>'
		Тогда открылось окно 'Введите имя новой ветки'
		И в поле с именем 'InputFld' я ввожу текст 'develop'
		И я нажимаю на кнопку с именем 'OK'
		Тогда открылось окно '*Vanessa Automation*'
		И Пауза 1
		И поле с именем "ДеревоGitВыборВетки" имеет заголовок "develop"
		
	* Переключение на ветку master
		И я нажимаю на кнопку с именем 'ДеревоGitВыборВетки'
		И я выбираю из списка 'master'
		И Пауза 1
		И поле с именем "ДеревоGitВыборВетки" имеет заголовок "master"

	* Закрытие клиента тестирования
		И я закрываю сеанс текущего клиента тестирования
			
