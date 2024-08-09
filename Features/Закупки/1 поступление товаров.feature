﻿#language: ru

 
Функционал: создание документа поступления товаров

Контекст:
 Дано Я открыл новый сеанс TestClient или подключил уже существующий


Сценарий: создание документа поступления товаров
// Создание документа поступления товаров
Как Менеджер по закупкам я хочу
создание документа поступления товаров 
* Открытие формы создания документа
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю "Закупки" "Поступления товаров"
	Тогда открылось окно "Поступления товаров"
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно "Поступление товара (создание)"
* Заполнение шапки
	И я нажимаю кнопку выбора у поля с именем 'Организация'
	И из выпадающего списка с именем 'Организация' я выбираю по строке "то"
	И я перехожу к следующему реквизиту
	И из выпадающего списка с именем 'Склад' я выбираю точное значение 'малый'
	Тогда элемент формы с именем 'Склад' стал равен "Малый"	
	И я перехожу к следующему реквизиту
	И из выпадающего списка с именем 'Валюта' я выбираю по строке "р"
	И я перехожу к следующему реквизиту
	И из выпадающего списка с именем 'Поставщик' я выбираю по строке "п"
	И я перехожу к следующему реквизиту
* Заполнение тч товары
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыТовар'
	И в таблице 'Товары' из выпадающего списка с именем 'ТоварыТовар' я выбираю по строке "то"
	И я перехожу к следующему реквизиту
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыКоличество'
	И в таблице 'Товары' в поле с именем 'ТоварыКоличество' я ввожу текст "1,00"
	И в таблице 'Товары' я завершаю редактирование строки
* Проверка заполнения тч товары
	И таблица 'Товары' содержит строки:
		| 'Товар' | 'Цена'   | 'Артикул' | 'Количество' | 'Сумма'  |
		| 'Торт ' | '150,00' | 'Т78'     | '15,00'       | '150,00' |
	И я нажимаю на кнопку "Записать"
* Номер
	И я запоминаю значение поля "Номер" как "$Номер$"	
* Проведение документа
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна "Поступление товара (создание) *" в течение 20 секунд
	чтобы поставить товар на учет  
* Проверка создания документа
	И таблица "Список" содержит строки:
		| 'Номер' |
		| '$Номер$'   |
  
Сценарий: Проверка наличия в справочнике номенклатуры Торт
И В командном интерфейсе я выбираю "Продажи" "Товары"
Тогда открылось окно "Товары"
И я нажимаю на кнопку с именем 'ФормаСписок'
	И таблица "Список" содержит строки:
		| 'Наименование' |
		| 'Торт'   |
