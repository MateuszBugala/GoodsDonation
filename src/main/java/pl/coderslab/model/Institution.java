package pl.coderslab.model;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "institutions")
public class Institution {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String name;
    private String mission;

    @ManyToOne
    private InstitutionType institutionType;

    @ManyToMany(cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
    private List<DoneeType> doneeTypes = new ArrayList<>();

    @ManyToMany(cascade = CascadeType.MERGE/*, fetch = FetchType.EAGER*/)
    private List<DonatedGoods> donatedGoods = new ArrayList<>();

    @ManyToOne
    private City city;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMission() {
        return mission;
    }

    public void setMission(String mission) {
        this.mission = mission;
    }

    public InstitutionType getInstitutionType() {
        return institutionType;
    }

    public void setInstitutionType(InstitutionType institutionType) {
        this.institutionType = institutionType;
    }

    public List<DoneeType> getDoneeTypes() {
        return doneeTypes;
    }

    public void setDoneeTypes(List<DoneeType> doneeTypes) {
        this.doneeTypes = doneeTypes;
    }

    public List<DonatedGoods> getDonatedGoods() {
        return donatedGoods;
    }

    public void setDonatedGoods(List<DonatedGoods> donatedGoods) {
        this.donatedGoods = donatedGoods;
    }

    public City getCity() {
        return city;
    }

    public void setCity(City city) {
        this.city = city;
    }
}
