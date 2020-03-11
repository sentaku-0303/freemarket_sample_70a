require 'rails_helper'
describe Address do
  describe '#create 住所登録に関するバリデーションのテスト' do

    context 'can save' do

      it "住所情報が全て揃っていれば登録できる" do
        user = create(:user)
        address = create(:address)
        address.valid?
        expect(address).to be_valid
      end

      it "建物名・部屋番号・電話番号が空の状態でも登録できる" do
        user = create(:user)
        address = build(:address, building_name: nil, room_number: nil, phone_number: nil )
        address.valid?
        expect(address).to be_valid
      end
    end

    context 'can not save' do

      it "family_name_kanjiが空だと登録できない" do
        user = create(:user)
        address = build(:address, family_name_kanji: nil)
        address.valid?
        expect(address.errors[:family_name_kanji]).to include("can't be blank")
      end

      it "first_name_kanjiが空だと登録できない" do
        user = create(:user)
        address = build(:address, first_name_kanji: nil)
        address.valid?
        expect(address.errors[:first_name_kanji]).to include("can't be blank")
      end

      it "family_name_kanaが空だと登録できない" do
        user = create(:user)
        address = build(:address, family_name_kana: nil)
        address.valid?
        expect(address.errors[:family_name_kana]).to include("can't be blank")
      end

      it "first_name_kanaが空だと登録できない" do
        user = create(:user)
        address = build(:address, first_name_kana: nil)
        address.valid?
        expect(address.errors[:first_name_kana]).to include("can't be blank")
      end

      it "family_name_kanjiが漢字でなければ登録できない" do
        user = create(:user)
        ['A', '1', '@', 'a', 'あ', 'ア'].each do |value|
          address = build(:address, family_name_kanji: "value")
          address.valid?
          expect(address.errors[:family_name_kanji]).to include("is invalid")
        end
      end

      it "first_name_kanjiが漢字でなければ登録できない" do
        user = create(:user)
        ['A', '1', '@', 'a', 'あ', 'ア'].each do |value|
          address = build(:address, first_name_kanji: "value")
          address.valid?
          expect(address.errors[:first_name_kanji]).to include("is invalid")
        end
      end

      it "family_name_kanaがカタカナでなければ登録できない" do
        user = create(:user)
        ['A', '1', '@', 'a', '亜', 'ア'].each do |value|
          address = build(:address, family_name_kana: "value")
          address.valid?
          expect(address.errors[:family_name_kana]).to include("is invalid")
        end
      end

      it "first_name_kanaがカタカナでなければ登録できない" do
        ['A', '1', '@', 'a', '亜', 'ア'].each do |value|
          address = build(:address, first_name_kana: "value")
          address.valid?
          expect(address.errors[:first_name_kana]).to include("is invalid")
        end
      end

      it "郵便番号が空だと登録できない" do
        user = create(:user)
        address = build(:address, family_name_kana: nil)
        address.valid?
        expect(address.errors[:family_name_kana]).to include("can't be blank")
      end

      it "都道府県が空だと登録できない" do
        user = create(:user)
        address = build(:address, family_name_kana: nil)
        address.valid?
        expect(address.errors[:family_name_kana]).to include("can't be blank")
      end

      it "市区町村名が空だと登録できない" do
        user = create(:user)
        address = build(:address, family_name_kana: nil)
        address.valid?
        expect(address.errors[:family_name_kana]).to include("can't be blank")
      end

      it "住所の番地が空だと登録できない" do
        user = create(:user)
        address = build(:address, family_name_kana: nil)
        address.valid?
        expect(address.errors[:family_name_kana]).to include("can't be blank")
      end

      it "電話番号が空だと登録できない" do
        user = create(:user)
        address = build(:address, family_name_kana: nil)
        address.valid?
        expect(address.errors[:family_name_kana]).to include("can't be blank")
      end

      it "userテーブルの外部キーがなければ登録できない" do
        user = create(:user)
        address = build(:address, first_name_kana: nil)
        address.valid?
        expect(address.errors[:first_name_kana]).to include("can't be blank")
      end
    end
  end
end