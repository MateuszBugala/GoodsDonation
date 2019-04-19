package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.coderslab.model.Donation;

import java.util.List;

public interface DonationRepository extends JpaRepository <Donation, Long> {

    List<Donation> findAllByUserId (Long id);
    @Query("SELECT sum(donations.qty) from Donation donations")
    Long donatedBags();

    @Query("SELECT count(distinct donations.institution) from Donation donations where donations.institution is not null")
    Long donatedInstitutions();

}
