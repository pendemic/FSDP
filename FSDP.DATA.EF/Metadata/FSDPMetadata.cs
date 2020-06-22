using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
namespace FSDP.DATA.EF//.Metadata
{
    public class ClassInfoMetadata
    {
        #region ClassInfo Metadata
        [Required(ErrorMessage ="Please Enter a Class Name")]
        [StringLength(50,ErrorMessage ="Max 50 Characters")]
        [Display(Name ="Class Name")]
        public string ClassName { get; set; }
        [Required(ErrorMessage = "Please Enter a Description")]
        [StringLength(300, ErrorMessage = "Max 300 Characters")]
        public string Description { get; set; }
        [Required(ErrorMessage = "Please Enter a Class Date")]
        [DataType(DataType.Date)]
        [Display(Name ="Start Date")]
        public System.DateTime ClassDate { get; set; }
        [Required(ErrorMessage = "Please Enter Level Requirement")]
        [Display(Name = "Level Required")]
        public int LevelRequired { get; set; }
        [Required(ErrorMessage = "Please Enter a Class Limit Size")]
        [Display(Name = "Max Occupancy")]
        public byte ClassLimit { get; set; }
        
    }
    [MetadataType(typeof(ClassInfoMetadata))]
    public partial class ClassInfo
    {

    }
    #endregion
    #region Location Metadata
    public class LocationMetadata
    {
        [Required(ErrorMessage = "Please Enter a Location Name")]
        [StringLength(50, ErrorMessage = "Max 50 Characters")]
        [Display(Name = "Location Name")]
        public string LocationName { get; set; }
        [Required(ErrorMessage = "Please Enter an Instructor Name")]
        [StringLength(30, ErrorMessage = "Max 30 Characters")]
        [Display(Name = "Instructor")]
        public string InstructorName { get; set; }
        [Required(ErrorMessage = "Please Enter Street Address")]
        [StringLength(100, ErrorMessage = "Max 100 Characters")]
        public string Address { get; set; }
        [Required(ErrorMessage = "Please Enter a City")]
        [StringLength(100, ErrorMessage = "Max 100 Characters")]
        public string City { get; set; }
        [Required(ErrorMessage = "Please Enter a State")]
        [StringLength(2, ErrorMessage = "Max 2 Characters")]
        public string State { get; set; }
        [Required(ErrorMessage = "Please Enter a Zip Code")]
        [StringLength(5, ErrorMessage = "Max 5 Characters")]
        [Display(Name = "Zip")]
        public string ZipCode { get; set; }
    }
    [MetadataType(typeof(LocationMetadata))]
    public partial class Location
    {

    }
    #endregion
    #region Owner Asset Metadata
    public class OwnerAssetMetadata
    {
        [Required(ErrorMessage = "Please enter a Name")]
        [StringLength(50, ErrorMessage = "Max 50 Characters")]
        [Display(Name = "Member Name")]
        public string AssetName { get; set; }
        [Required(ErrorMessage = "Please enter the Owner ID")]
        [StringLength(128, ErrorMessage = "Max 128 Characters")]
        public string OwnerID { get; set; }
        [StringLength(50, ErrorMessage = "Max 50 Characters")]
        [Display(Name = "Member Photo")]
        public string AssetPhoto { get; set; }
        [Required(ErrorMessage = "Please enter a Level")]
        [Display(Name = "Level")]
        public int LevelID { get; set; }
        [StringLength(300, ErrorMessage = "Max 300 Characters")]
        [Display(Name = "Notes")]
        public string SpecialNotes { get; set; }
        [Display(Name = "Active Member")]
        public bool IsActive { get; set; }
        [Display(Name = "Date Created")]
        public System.DateTime DateAdded { get; set; }
    }
    [MetadataType(typeof(OwnerAssetMetadata))]
    public partial class OwnerAsset
    {

    }
    #endregion
    #region UserDetail Metadata
    public class UserDetailMetadata
    {
        [StringLength(128, ErrorMessage = "Max 128 Characters")]
        public string UserID { get; set; }
        [Required(ErrorMessage = "Please Enter a First Name")]
        [StringLength(50, ErrorMessage = "Max 50 Characters")]
        [Display(Name = "First Name")]
        public string FirstName { get; set; }
        [Required(ErrorMessage = "Please Enter a Last Name")]
        [StringLength(50, ErrorMessage = "Max 50 Characters")]
        [Display(Name = "Last Name")]
        public string LastName { get; set; }
    }
    [MetadataType(typeof(UserDetailMetadata))]
    public partial class UserDetail
    {

    }
    #endregion
    #region Reservations
    public class ReservationMetadata
    {
        
        [Required(ErrorMessage = "MemberID is Required")]
        public int OwnerAssetID { get; set; }
        [Required(ErrorMessage = "Location is Required")]
        public int LocationID { get; set; }
        [Required(ErrorMessage = "Class is Required")]
        public int ClassID { get; set; }
    }
    [MetadataType(typeof(ReservationMetadata))]
    public partial class Reservation { }
    #endregion
    #region Level Metadata
    public class LevelMetadata
    {
        public int LevelID { get; set; }
        [Required(ErrorMessage = "Please Enter Name of Level")]
        [StringLength(20, ErrorMessage = "Max 20 Characters")]
        [Display(Name = "Level Name")]
        public string LevelName { get; set; }
        [Required(ErrorMessage = "Please Enter Description of Level")]
        [StringLength(20, ErrorMessage = "Max 100 Characters")]
        public string Description { get; set; }
    }
    [MetadataType(typeof(LevelMetadata))]
    public partial class Level { }
    #endregion
}
