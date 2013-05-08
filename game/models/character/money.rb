class Character < ActiveRecord::Base

  def has_enough_money?(money)
    self.money >= money and money >= 0
  end

  def has_enough_honor?(honor)
    self.honor >= honor and honor >= 0
  end

  def has_enough_diamond?(diamond)
    self.account.diamond >= diamond and diamond >= 0
  end

  def has_enough_voucher?(voucher)
    self.voucher >= voucher and voucher >= 0
  end

  def spend_money!(money)
    raise NotEnoughMoneyError if self.money < money or money < 0
    self.money -= money
    save!
  end

  def spend_honor!(honor)
    raise NotEnoughHonorError if self.honor < honor or honor < 0
    self.honor -= honor
    save!
  end

  def spend_diamond!(diamond)
    raise NotEnoughDiamondError if self.account.diamond < diamond or diamond < 0
    account = self.account
    account.diamond -= diamond
    account.save
  end

  def spend_voucher!(voucher)
    raise NotEnoughVoucherError if self.voucher < voucher or voucher < 0
    self.voucher -= voucher
    save!
  end

  def earn_money!(money)
    self.money += money
    save!
  end

  def earn_voucher!(voucher)
    self.voucher += voucher
    save!
  end

  def earn_honor!(honor)
    self.honor += honor
    save!
  end

  def earn_diamond!(diamond)
    account = self.account
    account.diamond += diamond
    account.save!
  end
end
