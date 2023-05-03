package com.kbstar.dto;

import lombok.*;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Cust {
    @Size(min=2, max=20, message="ID는 4자리에서 10자리 이내입니다.") //Controller에서 들어올 때 체크해주자.
    @NotEmpty
    private String id;
    @Size(min=3, max=20, message="비밀번호는 4자리에서 10자리 이내입니다.") //나중엔 형식도 정해줄 수 있다. 대-소문자
    @NotEmpty
    private String pwd;
    @NotEmpty(message = "NAME은 필수항목입니다. ")
    private String name;
}
