package com.cookandroid.zental;

import androidx.appcompat.app.AppCompatActivity;
import androidx.core.content.ContextCompat;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ListView;
import android.widget.TextView;

public class FaqPage extends AppCompatActivity {

    ListView mListView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.faq1);

        mListView = (ListView)findViewById(R.id.list1);

        dataSetting();
        TextView b1=(TextView) findViewById(R.id.button1);
        b1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                movePage();
            }
        });
    }

    private void dataSetting(){
        FaqAdapter adapter = new FaqAdapter();


        adapter.addItem(ContextCompat.getDrawable(getApplicationContext(),R.drawable.hj_faq1),"\n" +
                "거래 금지 품목 거래시 제재 받을 수 있습니다", "전자 통신판매법 등에 의해 저촉되어 인터넷 거래기준에 적용되는 상품으로 1회 적발시 즉시 이용제한이 될 수 있습니다.");
        adapter.addItem(ContextCompat.getDrawable(getApplicationContext(),R.drawable.hj_faq2),"\n" +
                "랜덤박스(비공개/반공개)는 분쟁의 원인이 되고 있습니다", "랜덤박스는 상품의 상태 및 내용물을 확인할 수 없거나 모호하여 분쟁과 신고 접수의 원인이 되고 있어 운영자에 의해 제재 받을 수 있습니다.");

        adapter.addItem(ContextCompat.getDrawable(getApplicationContext(),R.drawable.hj_faq3),"상품, 댓글의 10회 이상 도배, 번개톡 도배 등록을 피해주세요",
                "      ");

        adapter.addItem(ContextCompat.getDrawable(getApplicationContext(),R.drawable.hj_faq4),"\n" +
                        "욕설, 성희롱 등 비매너 행위는 타인을 불쾌하게 합니다",
                "비매너 행위에 관한 게시물과 댓글은 운영진에 의해 제재 받을 수 있습니다.");

        adapter.addItem(ContextCompat.getDrawable(getApplicationContext(),R.drawable.hj_faq5),"\n" +
                        "선정적이거나 판매 상품에 적절치 않은 이미지는 사용자 혼란을 일으킵니다",
                "판매하려는 상품을 명확히 표현하는 사진을 사용해주세요.");
        adapter.addItem(ContextCompat.getDrawable(getApplicationContext(),R.drawable.hj_faq6),"\n" +
                        "\n" +
                        "상품명, 키워드에 판매 상품과 관계없는 단어 삽입은 제재 받을 수 있습니다",
                "상품 노출을 높여보고자 인기 검색어를 마구 집어 넣는 행위는 여러 유저들에게 불편을 일으키는 원인이 됩니다.");

        adapter.addItem(ContextCompat.getDrawable(getApplicationContext(),R.drawable.hj_faq7),"정확한 상품 가격 정보를 입력해 주세요",
                "실제 판매하려는 가격과 다른 상품 가격정보를 써 놓아 구매자에게 혼돈을 주지 마세요.");


        mListView.setAdapter(adapter);
    }

    private void movePage(){
        Intent intent=new Intent(this, QnaPage.class);
        startActivity(intent);
    }
}
