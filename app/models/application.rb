class Application < ApplicationRecord

  CONVERTOR = {
      'possessor' => [
          'Физическое лицо',
          'Юридическое лицо'
      ],
      "item_power" => [
          'до 50 включительно',
          'свыше 50 до 70 включительно',
          'свыше 70 до 100 включительно',
          'свыше 100 до 120 включительно',
          'свыше 120 до 150 включительно',
          'свыше 150'
      ],
      "item_discount" => [
          '1 год без аварий (класс 4, кбм 0,95)',
          '2 года без аварий (класс 5, кбм 0,9)',
          '3 года без аварий (класс 6, кбм 0,85)',
          '4 года без аварий (класс 7, кбм 0,8)',
          '5 лет без аварий (класс 8, кбм 0,75)',
          '6 лет без аварий (класс 9, кбм 0,7)',
          '7 лет без аварий (класс 10, кбм 0,65)',
          '8 лет без аварий (класс 11, кбм 0,6)'
      ],
      'item_type' => [
          'Легковой автомобиль',
          'Грузовой автомобиль',
          'Автобус',
          'Мотоцикл, мотороллер',
          'Трамвай',
          'Троллейбус',
          'Трактор, самоходная дорожно-строительная или иная машина'
      ],
      'item_driverAgeStage' => [
          'старше 22 лет, стаж свыше 3 лет',
          'старше 22 лет, стаж до 3 лет включительно',
          'до 22 лет включительно, стаж свыше 3 лет',
          'до 22 лет включительно, стаж до 3 лет включительно'
      ],
      'navigators' => [
          'Без ограничений',
          '1', '2', '3', '4', '5', '6'
      ],
      'period_ispolzovania' => [
          '1 год',
          '9 месяцев',
          '8 месяцев',
          '7 месяцев',
          '6 месяцев',
          '5 месяцев',
          '4 месяца',
          '3 месяца'
      ]
  }

  belongs_to :user

  def converted_data_to_human

    new_data = data

    CONVERTOR.each do |key, value|

      new_data[key] = value[new_data[key].to_i]

    end

    new_data

  end

end
