﻿
///////////////////////////////////////////////////
//Служебные функции и процедуры
///////////////////////////////////////////////////

&НаКлиенте
// контекст фреймворка Vanessa-Behavior
Перем Ванесса;
 
&НаКлиенте
// Структура, в которой хранится состояние сценария между выполнением шагов. Очищается перед выполнением каждого сценария.
Перем Контекст Экспорт;
 
&НаКлиенте
// Структура, в которой можно хранить служебные данные между запусками сценариев. Существует, пока открыта форма Vanessa-Behavior.
Перем КонтекстСохраняемый Экспорт;

&НаКлиенте
// Функция экспортирует список шагов, которые реализованы в данной внешней обработке.
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	//описание параметров
	//Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,ОписаниеШага,ТипШага,Транзакция,Параметр);

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯВыполняюСкриптSikuliX(Парам01)","ЯВыполняюСкриптSikuliX","И я выполняю скрипт SikuliX ""ИмяСкрипта""","Выполняет скрипт SikuliX. Скрипт сначала ищется в кталоге проекта, за тем в каталогах библиотек, затем в стандартных скриптах Vanessa-Automation.","Прочее.SikuliX");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯОткрываюКартинкуВОсновномРедакторе(Парам01)","ЯОткрываюКартинкуВОсновномРедакторе","Дано я открываю картинку в основном редакторе ""ИмяКартинки""","Вызывает команду системы. Будет открыто приложение, которое ассоциировано для данного типа файлов.","Прочее.Открыть картинку");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯЖдуКогдаЗавершитсяПроцессСИДПроцессаВТечениеСекунд(Парам01, Парам02)","ЯЖдуКогдаЗавершитсяПроцессСИДПроцессаВТечениеСекунд","И я жду когда завершится процесс с ИД процесса ""PID"" в течение 10 секунд","Ожидает завершение процесса по его PID.","Прочее.Ожидание завершения процесса");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯЖдуКогдаЗакроетсяTestClientВТечениеСекунд(Парам01,Парам02)","ЯЖдуКогдаЗакроетсяTestClientВТечениеСекунд","И я жду когда закроется TestClient ""ИмяПрофиля"" в течение 10 секунд","Ожидает завершения сеанса тест клиента по имени его профиля.","Прочее.Ожидание завершения процесса");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯЗавершаюВыполнениеПроцессаОС(Парам01)","ЯЗавершаюВыполнениеПроцессаОС","И я завершаю выполнение процесса ОС ""ИмяПроцесса""","Завершает работу процесса в ОС по его имени (например vlc.exe).","Прочее.Завершение работы процесса");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯЗавершаюВыполнениеПроцессовКлиентовТестирования()","ЯЗавершаюВыполнениеПроцессовКлиентовТестирования","И я завершаю выполнение процессов клиентов тестирования","Завершает работу процессов клиентов тестирования. Процессы ищутся по маске ""1cv8c"", т.е. только тонкие клиенты. Под линукс происходит проверка, что процессу передан ключ /TESTCLIENT. Под windows такая проверка происходит если включно использование внешней компоненты VanessaExt. Иначе завершаются все процессы 1С, кроме данного менеджера тестирования.","Прочее.Завершение работы процесса");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯВыполняюКомандуСистемы(ТабПарам)",
		"ЯВыполняюКомандуСистемы",
		"И я выполняю команду системы
		|	|'СтрокаКоманды1'|
		|	|'СтрокаКоманды2'|",
		"Выполняет команду системы. В ОС Windows команда выполняется без показа чёрного окна консоли с помощью WshShell. В Linux команда выполняется с помощью метода встроенного языка КомандаСистемы().",
		"Прочее.Выполнить команду системы");
	
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,
		"ИнтернетДоступен()",
		"ИнтернетДоступен",
		"И интернет доступен",
		"Проверяет доступность интернета с помощью команды ping некоторых интернет сервисов.","Прочее.Проверка доступности интернет");
	
	Возврат ВсеТесты;
КонецФункции
	
&НаСервере
// Служебная функция.
Функция ПолучитьМакетСервер(ИмяМакета)
	ОбъектСервер = РеквизитФормыВЗначение("Объект");
	Возврат ОбъектСервер.ПолучитьМакет(ИмяМакета);
КонецФункции
	
&НаКлиенте
// Служебная функция для подключения библиотеки создания fixtures.
Функция ПолучитьМакетОбработки(ИмяМакета) Экспорт
	Возврат ПолучитьМакетСервер(ИмяМакета);
КонецФункции



///////////////////////////////////////////////////
//Работа со сценариями
///////////////////////////////////////////////////

&НаКлиенте
// Процедура выполняется перед началом каждого сценария
Процедура ПередНачаломСценария() Экспорт
	
КонецПроцедуры

&НаКлиенте
// Процедура выполняется перед окончанием каждого сценария
Процедура ПередОкончаниемСценария() Экспорт
	
КонецПроцедуры



///////////////////////////////////////////////////
//Реализация шагов
///////////////////////////////////////////////////

&НаКлиенте
Функция ИскатьСкриптSikuliXВКаталоге(КаталогДляПоиска,ИмяФайла)
	СписокКаталогов = Новый СписокЗначений;
	СписокФайлов    = Новый СписокЗначений;
	Ванесса.НайтиФайлыКомандаСистемы(КаталогДляПоиска,СписокКаталогов,СписокФайлов,Истина);
	Для Каждого Элем Из СписокКаталогов Цикл
		Если НРег(Элем.Значение.Имя) = НРег(ИмяФайла) Тогда
			Возврат Элем.Значение.ПолноеИмя;
		КонецЕсли;	 
	КонецЦикла;	 
КонецФункции	 

&НаКлиенте
Функция ПолныйПутьКСкрипту(Знач ИмяСкрипта)
	Если Прав(ИмяСкрипта,7) <> ".sikuli" Тогда
		ИмяСкрипта = ИмяСкрипта + ".sikuli";
	КонецЕсли;	 
	
	//проверка, что передали полный путь
	Если Ванесса.ФайлСуществуетКомандаСистемы(ИмяСкрипта) Тогда
		Возврат ИмяСкрипта;
	КонецЕсли;	 
	
	//Поиск в каталоге проекта
	ПолныйПуть = ИскатьСкриптSikuliXВКаталоге(Ванесса.Объект.КаталогПроекта,ИмяСкрипта);
	Если ПолныйПуть <> Неопределено Тогда
		Возврат ПолныйПуть; 
	КонецЕсли;	 
	
	//Поиск в каталогах бибилотек
	Для Каждого Элем Из Ванесса.Объект.КаталогиБиблиотек Цикл
		ПутьДляПоиска = Элем.Значение;
		ПолныйПуть = ИскатьСкриптSikuliXВКаталоге(ПутьДляПоиска,ИмяСкрипта);
		Если ПолныйПуть <> Неопределено Тогда
			Возврат ПолныйПуть; 
		КонецЕсли;	 
	КонецЦикла;	 
	
	ПутьДляПоиска = Ванесса.ДополнитьСлешВПуть(Ванесса.Объект.КаталогИнструментов) + "tools\Sikuli";
	ПолныйПуть = ИскатьСкриптSikuliXВКаталоге(ПутьДляПоиска,ИмяСкрипта);
	Если ПолныйПуть <> Неопределено Тогда
		Возврат ПолныйПуть; 
	КонецЕсли;	 
	
	Возврат Неопределено;
КонецФункции	 

&НаКлиенте
//И я выполняю скрипт SikuliX "ИмяСкрипта"
//@ЯВыполняюСкриптSikuliX(Парам01)
Процедура ЯВыполняюСкриптSikuliX(ИмяСкрипта) Экспорт
	ПолныйПутьКСкрипту = ПолныйПутьКСкрипту(ИмяСкрипта);
	
	Если ПолныйПутьКСкрипту = Неопределено Тогда
		ТекстСообщения = Ванесса.ПолучитьТекстСообщенияПользователю("Не найден SikuliX скрипт <%1>.");
		ТекстСообщения = СтрЗаменить(ТекстСообщения,"%1",ИмяСкрипта);
		ВызватьИсключение ТекстСообщения;
	КонецЕсли;	 
	
	ОписаниеОшибки = "";
	Результат = Ванесса.ВыполнитьSikuliСкрипт(ПолныйПутьКСкрипту,-1,Истина,ОписаниеОшибки);
	Если Результат <> 0 Тогда
		ТекстСообщения = Ванесса.ПолучитьТекстСообщенияПользователю("Не удалось выполнить SukuliX скрипт <%1>.");
		ТекстСообщения = СтрЗаменить(ТекстСообщения,"%1",ИмяСкрипта);
		ТекстСообщения = ТекстСообщения + Символы.ПС + ОписаниеОшибки;
		ВызватьИсключение ТекстСообщения;
	КонецЕсли;	 

	
КонецПроцедуры

&НаКлиенте
//Дано я открываю картинку в основном редакторе "ОтчетAllure2"
//@ЯОткрываюКартинкуВОсновномРедакторе(Парам01)
Процедура ЯОткрываюКартинкуВОсновномРедакторе(ИмяКартинки) Экспорт
	Файл = Ванесса.ПолучитьФайлКартинки(ИмяКартинки);
	ПутьКФайлу = СтрЗаменить(Файл.ПолноеИмя,"\","/");
	Ванесса.ВыполнитьКомандуОСБезПоказаЧерногоОкна(ПутьКФайлу,0);
КонецПроцедуры

&НаКлиенте
//И я жду когда завершится процесс с ИД процесса "PID" в течение
//@ЯЖдуКогдаЗавершитсяПроцессСИДПроцесса(Парам01, Парам02)
Процедура ЯЖдуКогдаЗавершитсяПроцессСИДПроцессаВТечениеСекунд(Парам01, Парам02) Экспорт
	//Ванесса.ПосмотретьЗначение(Парам01,Истина);
	
	Если Ванесса.ЭтоLinux Тогда
		ВызватьИсключение Ванесса.ПолучитьТекстСообщенияПользователю("Не реализовано.");
	КонецЕсли;
	
	PID = XMLСтрока(Парам01);
	Секунд = Парам02;
	
	Ванесса.ЗапретитьВыполнениеШагов();
	
	ДатаНачалаВыполненияОбработчикаОжидания = ТекущаяДата();
	ПодключитьОбработчикОжидания("ЯЖдуКогдаЗавершитсяПроцессСИДПроцессаТик", 1, Ложь);
	
КонецПроцедуры

&НаКлиенте
//И я жду когда закроется TestClient "ПодготовкаОкружения" в течение 10 секунд
//@ЯЖдуКогдаЗакроетсяTestClientВТечениеСекунд(Парам01,Парам02)
Процедура ЯЖдуКогдаЗакроетсяTestClientВТечениеСекунд(ИмяTestClient,Парам02) Экспорт
	СвойстваTestClient = Ванесса.ПолучитьДанныеКлиентаТестирования(ИмяTestClient);
	
	Если Ванесса.ЭтоLinux Тогда
		ВызватьИсключение Ванесса.ПолучитьТекстСообщенияПользователю("Не реализовано.");
	КонецЕсли;
	
	PID = ВычислитьTestClientPID(СвойстваTestClient.ПортЗапускаТестКлиента);
	
	Если PID = Неопределено Или ПустаяСтрока(PID) Тогда 
		Ванесса.ОбновитьДанныеКлиентовТестированияПослеОтключенияКлиентаТестирования();
		Возврат;
	КонецЕсли;
	
	Секунд = Ванесса.ЗначениеТаймаутаДляАсинхронногоШага(Парам02);
	ОбновитьДанныеКлиентовТестирования = Истина;
	
	Ванесса.ЗапретитьВыполнениеШагов();
	
	ДатаНачалаВыполненияОбработчикаОжидания = ТекущаяДата();
	ПодключитьОбработчикОжидания("ЯЖдуКогдаЗавершитсяПроцессСИДПроцессаТик", 1, Ложь);
	
КонецПроцедуры

&НаКлиенте
Процедура ЯЖдуКогдаЗавершитсяПроцессСИДПроцессаТик()
	ИмяОбработчика = "ЯЖдуКогдаЗавершитсяПроцессСИДПроцессаТик";
	
	Если НЕ Ванесса.ИдетВыполнениеСценариев() Тогда
		ОтключитьОбработчикОжидания(ИмяОбработчика);
		Возврат;
	КонецЕсли;	 	
	
	Команда = "TaskList /FI ""PID EQ %1""";
	Команда = СтрЗаменить(Команда,"%1",PID);
	ПотокВывода = Ванесса.ВыполнитьКомандуСПотокомВывода(Команда);
	
	Если Найти(ПотокВывода, "INFO: No tasks are running which match the specified criteria.") > 0 Тогда
		Если ОбновитьДанныеКлиентовТестирования Тогда 
			Ванесса.ОбновитьДанныеКлиентовТестированияПослеОтключенияКлиентаТестирования();
		КонецЕсли;
		
		ОтключитьОбработчикОжидания(ИмяОбработчика);
		Ванесса.ПродолжитьВыполнениеШагов();
		Возврат;
	КонецЕсли;
	
	Если ТекущаяДата() > (ДатаНачалаВыполненияОбработчикаОжидания + Секунд) Тогда
		ОтключитьОбработчикОжидания(ИмяОбработчика);
		ТекстСообщения = "Ожидали, что процесс с ИД <%1> будет завершен в течение <%2> секунд.";
		ТекстСообщения = СтрЗаменить(ТекстСообщения,"%1",PID);
		ТекстСообщения = СтрЗаменить(ТекстСообщения,"%2",Секунд);
		Ванесса.ПродолжитьВыполнениеШагов(Истина,ТекстСообщения);
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Функция ВычислитьTestClientPID(TPort)
	
	Команда = "wmic path win32_process get ProcessID, CommandLine /format:csv";
	ПотокВывода = Ванесса.ВыполнитьКомандуСПотокомВывода(Команда, КодировкаТекста.UTF16);
	
	Для Счетчик = 1 По СтрЧислоСтрок(ПотокВывода) Цикл
		ТекСтрока = СтрПолучитьСтроку(ПотокВывода, Счетчик);
		Стр = "-TPort %1";
		Стр = СтрЗаменить(Стр,"%1",XMLСтрока(TPort));
		Если Найти(ТекСтрока, Стр) > 0 Тогда 
			Направление = Вычислить("НаправлениеПоиска.СКонца");
			Позиция = Вычислить("СтрНайти(ТекСтрока, "","", Направление)");
			Возврат Сред(ТекСтрока, Позиция + 1);
		КонецЕсли;
	КонецЦикла;
	
	Возврат Неопределено;
	
КонецФункции

&НаКлиенте
//И я завершаю выполнение процесса ОС "ИмяПроцесса"
//@ЯЗавершаюВыполнениеПроцессаОС(Парам01)
Функция ЯЗавершаюВыполнениеПроцессаОС(ИмяПриложения) Экспорт
	Ванесса.TASKKILL(ИмяПриложения);
КонецФункции

&НаКлиенте
//И я завершаю выполнение процессов клиентов тестирования
//@ЯЗавершаюВыполнениеПроцессовКлиентовТестирования()
Функция ЯЗавершаюВыполнениеПроцессовКлиентовТестирования() Экспорт
	Ванесса.ЗавершитьСеансыTestClientПринудительно();
КонецФункции

&НаКлиенте
//И я выполняю команду системы
//@ЯВыполняюКомандуСистемы(ТабПарам)
Функция ЯВыполняюКомандуСистемы(ТабПарам) Экспорт
	Если ТипЗнч(ТабПарам) = Тип("Строка") Тогда
		Стр = ТабПарам;
	Иначе	
		Стр = "";
		Для Каждого СтрокаТабПарам Из ТабПарам Цикл
			Стр = Стр + СтрокаТабПарам.Кол1 + Символы.ПС;
		КонецЦикла;	 
	КонецЕсли;	 
	
	Ванесса.ВыполнитьКомандуОСБезПоказаЧерногоОкна(Стр);
КонецФункции

&НаКлиенте
Функция СервисДоступен(АдресСервиса)
	ФайлВывода = ПолучитьИмяВременногоФайла("txt");
	Команда = "ping " + АдресСервиса + " -n 2 > """ + ФайлВывода + """";
	Ванесса.ВыполнитьКомандуОСБезПоказаЧерногоОкна(Команда);
	
	Если НЕ Ванесса.ФайлСуществуетКомандаСистемы(ФайлВывода) Тогда
		Возврат Ложь;
	КонецЕсли;
	
	Текст = Новый ЧтениеТекста;
	Текст.Открыть(ФайлВывода, "UTF-8");
	ТекстФайла = Текст.Прочитать();
	Текст.Закрыть();
	
	Если Найти(ТекстФайла, "Received = 2") > 0 ИЛИ Найти(ТекстФайла, "Received = 1") Тогда
		Возврат Истина;
	КонецЕсли;	 
	
	Если Найти(ТекстФайла, "получено = 2") > 0 ИЛИ Найти(ТекстФайла, "получено = 1") Тогда
		Возврат Истина;
	КонецЕсли;	 
	
	Возврат Ложь;
	
КонецФункции	 

&НаКлиенте
//И интернет доступен
//@ИнтернетДоступен()
Процедура ИнтернетДоступен() Экспорт
	
	Если СервисДоступен("ya.ru") Тогда
		Возврат;
	КонецЕсли;	 
	
	Если СервисДоступен("8.8.8.8") Тогда //основной DNS-сервер Google
		Возврат;
	КонецЕсли;	 
	
	ВызватьИсключение "Интернет недоступен.";
	
КонецПроцедуры
